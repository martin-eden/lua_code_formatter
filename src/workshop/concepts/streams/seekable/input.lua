-- Common methods for seekable input stream

--[[
  Author: Martin Eden
  Last mod.: 2026-11-19
]]

local get_segment =
  function(me, seg)
    local init_pos = me:get_position()
    me:set_position(seg[1])
    local result = me:read(seg[2])
    me:set_position(init_pos)
    return result
  end

return
  {
    get_segment = get_segment,
  }

--[[
  2017
  2026-11-19
]]
