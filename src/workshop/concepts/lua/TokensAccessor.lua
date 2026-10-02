-- Accessor for typed tokens list. Works with [processor] and [parse].

--[[
  Author: Martin Eden
  Last mod.: 2026-10-27
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
  Interface between [processor] and [match_string]

  Processor receives input stream handler which has methods
  to get/set reading index and method to compare with string.

  Processor calls match_string(). If it succeeds it must return
  TRUE and update it's reading index. Processor WONT update
  reading index for us if match succeeded. It only sets it back
  if match failed.
]]

local match_string =
  function(Me, str)
    if (Me[2] > Me[3]) then return false end
    if (Me[1][Me[2]][1] ~= str) then return false end
    Me[2] = Me[2] + 1
    return true
  end

local get_position =
  function(Me)
    return Me[2]
  end

local set_position =
  function(Me, position)
    Me[2] = position
  end

local get_segment =
  function(Me, start, len)
    -- No sense in concatenating several strings
    if (len ~= 1) then return end
    if (start > Me[3]) then return end
    return Me[1][start][1]
  end

local read_type =
  function(Me, type)
    if (Me[2] > Me[3]) then return false end
    if (Me[1][Me[2]].type ~= type) then return false end
    Me[2] = Me[2] + 1
    return true
  end

local is_name =
  function(Me)
    return read_type(Me, 'name')
  end

local is_string =
  function(Me)
    return read_type(Me, 'string')
  end

local is_number =
  function(Me)
    return read_type(Me, 'number')
  end

local Interface
local create
do
  local attach_methods = request('!.table.attach_methods')
  create =
    function(TokensList)
      local Me = { TokensList, 1, #TokensList }
      attach_methods(Me, Interface)
      return Me
    end
end

--[[
  We're implementing stream for [mechs.processor] and [mechs.parser]

  We have to provide methods

    ( match_string get_position set_position get_segment)
]]

Interface =
  {
    create = create,
    match_string = match_string,
    get_position = get_position,
    set_position = set_position,
    get_segment = get_segment,
    IsName = is_name,
    IsString = is_string,
    IsNumber = is_number,
  }

return Interface

--[[
  2026-10-27
]]
