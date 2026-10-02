-- Create file with given pathname and contents

--[[
  Author: Martin Eden
  Last mod.: 2026-10-02
]]

local get_dir_name = request('!.concepts.path_name.get_host_dir_str')
local mkdir = request('!.file_system.directory.create')
local open_file = request('open')
local close_file = request('close')

-- Export:
return
  function(pathname, contents)
    assert_string(pathname)
    assert_string(contents)

    mkdir(get_dir_name(pathname))

    local File = open_file(pathname, 'wb')
    File:write(contents)
    close_file(File)
  end

--[[
  2024 #
  2026 #
  2026-10-02
]]
