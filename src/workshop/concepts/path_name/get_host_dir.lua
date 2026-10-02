-- Return list with host directory for pathname list

--[[
  Author: Martin Eden
  Last mod.: 2026-09-10
]]

local self_dir = request('Syntels').self_dir
local is_directory = request('is_directory')
local is_absolute = request('is_absolute')
local select_seg = request('!.concepts.list.select_seg')
local add_to_list = request('!.concepts.list.add_item')

-- Export:
return
  function(Pathname)
    local HostDir

    local host_dir_end_idx
    if is_directory(Pathname) then
      host_dir_end_idx = #Pathname - 2
    else
      host_dir_end_idx = #Pathname - 1
    end

    if (host_dir_end_idx <= 0) then
      --[[
        Cases when we can come here: ".", "..", "/", "abc".
        We need to provide host dir for them.
        Zen question: what is the name of "parent dir" for ".."?
        That's why we're using name "host", not "parent".
      ]]
      if is_absolute(Pathname) then
        HostDir = { '' }
      else
        HostDir = { self_dir }
      end
    else
      HostDir = select_seg(Pathname, 1, host_dir_end_idx)
    end

    add_to_list(HostDir, '')

    return HostDir
  end

--[[
  2026 #
  2026-09-10
]]
