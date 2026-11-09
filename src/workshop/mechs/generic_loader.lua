-- Parse string with given syntax. Optilonally apply transformations

--[[
  Author: Martin Eden
  Last mod.: 2026-11-13
]]

local string_input_stream =
  request('!.mechs.streams.mergeable.string.interface')
local parse = request('parser.parse')

return
  function(data_str, syntax, ...)
    local input_stream = new(string_input_stream)
    input_stream:init(data_str)

    local result
    do
      local is_parsed, data_struc = parse(input_stream, syntax)
      if is_parsed then
        result = data_struc
        for i = 1, select('#', ...) do
          result = select(i, ...)(result)
        end
      end
    end

    local unparsed_tail
    do
      local elems_remained =
        input_stream:get_length() - input_stream:get_position() + 1
      if (elems_remained > 0) then
        unparsed_tail = input_stream:read(elems_remained)
      end
    end

    return result, unparsed_tail
  end

--[[
  2016 # #
  2017 # #
  2018 # #
  2026-10-26
]]
