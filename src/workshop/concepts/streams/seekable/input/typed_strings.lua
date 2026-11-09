-- Seekable input sequence of typed strings

--[[
  Author: Martin Eden
  Last mod.: 2026-11-19
]]

--[[
  Storage format

    1 [i] position (from 1)
    2 [i] sequence length
    3 [t] sequence
      0+ [t] -- typed string
        type [s] -- node type for use in string matching
        1 [s] -- value
]]

--[[
  This part is for [mechs.processor]

  Processor receives this input stream handler which must have methods

    * get_position
    * set_position
    * read
    * match_string
        If it succeeds it must return TRUE and advance reading position.
        Processor WONT update reading position for us if match succeeded.
        It only sets it back if match failed.
]]

local get_position =
  function(me)
    return me[1]
  end

local set_position =
  function(me, new_position)
    me[1] = new_position
  end

local get_sequence =
  function(me)
    return me[3]
  end

local read =
  function(me)
    if (me[1] > me[2]) then return end
    local result = me[3][me[1]][1]
    me[1] = me[1] + 1
    return result
  end

local match_type =
  function(me, type)
    if (me[1] > me[2]) then return end
    if (me[3][me[1]].type == type) then
      me[1] = me[1] + 1
      return true
    end
  end

local match_string =
  function(me, str)
    if (me[1] > me[2]) then return end
    if (me[3][me[1]][1] == str) then
      me[1] = me[1] + 1
      return true
    end
  end

local interface
local create
do
  local attach_methods = request('!.table.attach_methods')
  create =
    function(list)
      local me = { 1, #list, list }
      attach_methods(me, interface)
      return me
    end
end

interface =
  {
    -- Core:
    create = create,
    get_position = get_position,
    set_position = set_position,
    read = read,
    -- Extensions:
    match_type = match_type,
    match_string = match_string,
    get_sequence = get_sequence,
  }

local merge = request('!.table.merge')
local common_input = request('^.input')
merge(interface, common_input)

-- Export:
return interface

--[[
  2026-11-19
]]
