-- String indent

--[[
  Author: Martin Eden
  Last mod.: 2026-11-11
]]

--[[
  Data storage format

    1 [s] -- indent chunk
    2 [t] -- range point with current indent level
]]

--[[
  That's amazing how verbose seemingly simple things are
  becoming in practice.
]]

--[[
  Concept

  Imagine it as "Tab" key which emits <Cur> chunks:

     Min     Cur                                     Max
    |---|---|---|---|---|---|---|---|---|---|---|---|---|

  Design

  We're exporting many methods because it needs to be customizable.
  And each field is two methods ("get" and "set").

  Implementation

  For ( min cur max ) we're using [range_point].
  String with indent chunk is ours.
]]

local get_indent_level =
  function(me)
    return me[2]:get_value()
  end

local set_indent_level =
  function(me, level)
    me[2]:set_value(level)
  end

local to_string
do
  local str_rep = string.rep
  to_string =
    function(me)
      return str_rep(me[1], me[2]:get_value())
    end
end

local inc =
  function(me)
    set_indent_level(me, get_indent_level(me) + 1)
  end

local dec =
  function(me)
    set_indent_level(me, get_indent_level(me) - 1)
  end

local interface
local create
do
  local range_point_class = request('!.concepts.range_point')
  local attach_methods = request('!.table.attach_methods')
  create =
    function(indent_chunk, min_indent, max_indent)
      local range_point =
        range_point_class.create(min_indent, max_indent)

      local me = { indent_chunk, range_point }
      attach_methods(me, interface)

      return me
    end
end

interface =
  {
    create = create,

    get_indent_level = get_indent_level,
    set_indent_level = set_indent_level,

    to_string = to_string,

    inc = inc,
    dec = dec,
  }

-- Export:
return interface

--[[
  2026 # # #
  2026-11-11
]]
