local get_cmd_copy =
  function(src_name, dest_name)
    return ('cp %s %s'):format(src_name, dest_name)
  end

local directories_created

local get_cmd_mkdir =
  function(dir_name)
    if not directories_created[dir_name] then
      local parent_path = ''
      for parent_dir in dir_name:gmatch('(.-)/') do
        parent_path = parent_path .. parent_dir
        directories_created[parent_path] = true
        parent_path = parent_path .. '/'
      end
      directories_created[dir_name] = true
      return ('mkdir -p %s'):format(dir_name)
    end
  end

local get_loaded_module_files = request('^.handy_mechs.get_loaded_module_files')

local get_deploy_script =
  function(deploy_dir)
    deploy_dir = (deploy_dir or 'deploy/')

    directories_created = {}
    local result = {}
    local files = get_loaded_module_files()
    table.sort(files)
    for i = 1, #files do
      local source = files[i]
      local dest = deploy_dir .. files[i]:gsub('%.%./', '')
      local directory = dest:match('(.+)/')
      result[#result + 1] = get_cmd_mkdir(directory)
      result[#result + 1] = get_cmd_copy(source, dest)
    end
    result[#result + 1] = ''
    result = table.concat(result, '\n')
    return result
  end

local save_deploy_script =
  function(script_name, deploy_dir)
    script_name = script_name or 'deploy.sh'
    local f, err_msg = io.open(script_name, 'w+')
    if not f then
      error(err_msg)
    end
    f:write('#!/bin/bash', '\n')
    f:write(get_deploy_script(deploy_dir))
    f:close()
  end

return
  {
    get_modules_list = get_deploy_list,
    get_script = get_deploy_script,
    save_script = save_deploy_script,
  }
