-- Convert lines to string. Tailing newline.

--[[
  Author: Martin Eden
  Last mod.: 2026-11-13
]]

local list_to_str = request('!.concepts.list.to_string')
local newline = request('!.concepts.ascii.chars').newline

return
  function(lines)
    return list_to_str(lines, newline) .. newline
  end

--[[
  2024 #
  2026 # #
]]
