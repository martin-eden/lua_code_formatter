-- Return list with host directory for pathname list

--[[
  Author: Martin Eden
  Last mod.: 2026-11-11
]]

local self_dir = request('syntels').self_dir
local is_directory = request('is_directory')
local is_absolute = request('is_absolute')
local select_seg = request('!.concepts.list.select_seg')
local add_to_list = request('!.concepts.list.add_item')

return
  function(pathname)
    local host_dir

    local host_dir_end_idx
    if is_directory(pathname) then
      host_dir_end_idx = #pathname - 2
    else
      host_dir_end_idx = #pathname - 1
    end

    if (host_dir_end_idx <= 0) then
      --[[
        Cases when we can come here: ".", "..", "/", "abc".
        We need to provide host dir for them.
        Zen question: what is the name of "parent dir" for ".."?
        That's why we're using name "host", not "parent".
      ]]
      if is_absolute(pathname) then
        host_dir = { '' }
      else
        host_dir = { self_dir }
      end
    else
      host_dir = select_seg(pathname, 1, host_dir_end_idx)
    end

    add_to_list(host_dir, '')

    return host_dir
  end

--[[
  2026 #
  2026-09-10
]]
