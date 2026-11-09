-- Seekable input string stream interface

--[[
  Author: Martin Eden
  Last mod.: 2026-11-19
]]

--[[
  Storage format

    1 [i] position
    2 [s] string
]]

local get_position =
  function(me)
    return me[1]
  end

local set_position
do
  local constrain = request('!.number.constrain')
  set_position =
    function(me, new_position)
      me[1] = constrain(new_position, 1, #me[2] + 1)
    end
end

local get_length =
  function(me)
    return #me[2]
  end

local str_sub = string.sub

local read =
  function(me, num_slots)
    local pos = me[1]
    local result = str_sub(me[2], pos, pos + num_slots - 1)
    if (#result == num_slots) then
      me[1] = pos + #result
      return result
    end
  end

local match_string =
  function(me, str)
    local pos = me[1]
    local segment = str_sub(me[2], pos, pos + #str - 1)
    if (segment == str) then
      me[1] = pos + #str
      return true
    end
  end

local match_regexp
do
  local str_find = string.find
  match_regexp =
    function(me, pattern)
      local start, finish, capture = str_find(me[2], pattern, me[1])
      if start then
        me[1] = finish + 1
        capture = capture or str_sub(me[2], start, finish)
        return capture
      end
    end
end

local interface
local create
do
  local attach_methods = request('!.table.attach_methods')
  create =
    function(str)
      local me = { 1, str }
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
    get_length = get_length,
    match_string = match_string,
    match_regexp = match_regexp,
  }

local merge = request('!.table.merge')
local common_input = request('^.input')
merge(interface, common_input)

-- Export:
return interface
