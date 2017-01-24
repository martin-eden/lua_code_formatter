local split_string = request('^.string.split')

local get_paths =
  function()
    local result = split_string(package.path, ';')
    return result
  end

local get_module_names =
  function()
    local result = {}
    for k in pairs(package.loaded) do
      result[#result + 1] = k
    end
    return result
  end

local file_exists = request('^.file.exists')

return
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
