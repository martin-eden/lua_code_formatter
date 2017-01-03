local file_exists = request('^.file.exists')

local get_module_names =
  function()
    local result = {}
    for k in pairs(package.loaded) do
      result[#result + 1] = k
    end
    return result
  end

local paths_pattern = '(.-)%;'
local get_paths =
  function()
    local result = {}
    for path in (package.path .. ';'):gmatch(paths_pattern) do
      result[#result + 1] = path
    end
    return result
  end

local get_deploy_list =
  function()
    local result = {}
    local paths = get_paths()
    local modules = get_module_names()
    for i = 1, #modules do
      local aligned_module_name = modules[i]:gsub('%.', '/')
      for j = 1, #paths do
        local possible_script_name = paths[j]:gsub('%?', aligned_module_name)
        if file_exists(possible_script_name) then
          result[#result + 1] = possible_script_name
        end
      end
    end
    return result
  end

local get_directory_part =
  function(script_name)
    return script_name:match('(.+)/')
  end

local macro_pattern = '(<.->)'
local get_deploy_script =
  function(dest_dir)
    dest_dir = (dest_dir or 'deploy') .. '/'
    local result = {}
    local files = get_deploy_list()
    local meta_command = 'mkdir -p <directory>; cp <source> <dest>'
    for i = 1, #files do
      local source = files[i]
      local dest = dest_dir .. files[i]:gsub('%.%./', '')
      local directory = get_directory_part(dest)
      local t =
        {
          ['<source>'] = source,
          ['<dest>'] = dest,
          ['<directory>'] = directory,
        }
      local command = meta_command:gsub(macro_pattern, t)
      result[#result + 1] = command
    end
    result[#result + 1] = ''
    result = table.concat(result, '\n')
    return result
  end

local save_deploy_script =
  function(script_name, dest_dir)
    script_name = script_name or 'deploy.sh'
    local f, err_msg = io.open(script_name, 'w+')
    if not f then
      error(err_msg)
    end
    f:write('#!/bin/bash', '\n')
    f:write(get_deploy_script(dest_dir))
    f:close()
  end

return
  {
    get_modules_list = get_deploy_list,
    get_script = get_deploy_script,
    save_script = save_deploy_script,
  }
