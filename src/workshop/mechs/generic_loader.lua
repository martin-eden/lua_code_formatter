-- Parse string with given syntax. Optilonally apply transformations

--[[
  Author: Martin Eden
  Last mod.: 2026-10-26
]]

local StringInputStream =
  request('!.mechs.streams.mergeable.string.interface')
local parse = request('parser.parse')

return
  function(data_str, Syntax, ...)
    local InputStream = new(StringInputStream)
    InputStream:init(data_str)

    local Result

    local is_parsed, DataStruc = parse(InputStream, Syntax)
    if is_parsed then
      Result = DataStruc
      for i = 1, select('#', ...) do
        local struc_transformer = select(i, ...)
        Result = struc_transformer(Result)
      end
    end

    local unparsed_tail
    local elems_remained =
      InputStream:get_length() - InputStream:get_position() + 1
    if (elems_remained > 0) then
      unparsed_tail = InputStream:read(elems_remained)
    end

    return Result, unparsed_tail
  end

--[[
  2016 # #
  2017 # #
  2018 # #
  2026-10-26
]]
