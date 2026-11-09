-- Accessor for typed tokens list. Works with [processor] and [parse].

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  Storage format

    1 [t] -- list of typed tokens
      0+ [t] -- typed token record
        type [s] -- token type
        1 [s] -- token value
    2 [i] -- item index
    3 [i] -- num items
]]

--[[
  interface between [processor] and [match_string]

  Processor receives input stream handler which has methods
  to get/set reading index and method to compare with string.

  Processor calls match_string(). If it succeeds it must return
  TRUE and update it's reading index. Processor WONT update
  reading index for us if match succeeded. It only sets it back
  if match failed.
]]

local match_string =
  function(me, str)
    if (me[2] > me[3]) then return false end
    if (me[1][me[2]][1] ~= str) then return false end
    me[2] = me[2] + 1
    return true
  end

local get_position =
  function(me)
    return me[2]
  end

local set_position =
  function(me, position)
    me[2] = position
  end

local get_segment =
  function(me, start, len)
    -- No sense in concatenating several strings
    if (len ~= 1) then return end
    if (start > me[3]) then return end
    return me[1][start][1]
  end

local read_type =
  function(me, type)
    if (me[2] > me[3]) then return false end
    if (me[1][me[2]].type ~= type) then return false end
    me[2] = me[2] + 1
    return true
  end

local is_name =
  function(me)
    return read_type(me, 'name')
  end

local is_string =
  function(me)
    return read_type(me, 'string')
  end

local is_number =
  function(me)
    return read_type(me, 'number')
  end

local interface
local create
do
  local attach_methods = request('!.table.attach_methods')
  create =
    function(tokens)
      local me = { tokens, 1, #tokens }
      attach_methods(me, interface)
      return me
    end
end

--[[
  We're implementing stream for [mechs.processor] and [mechs.parser]

  We have to provide methods

    ( match_string get_position set_position get_segment)
]]

interface =
  {
    create = create,
    match_string = match_string,
    get_position = get_position,
    set_position = set_position,
    get_segment = get_segment,
    is_name = is_name,
    is_string = is_string,
    is_number = is_number,
  }

return interface

--[[
  2026-10-27
]]
