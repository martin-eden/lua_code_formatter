local parse = request('parser.parse')

-- local c_stream = request('!.mechs.streams.mergeable.file.interface')
local c_stream = request('!.mechs.streams.mergeable.string.interface')

-- local profiler = request('!.system.profiler')
-- local to_str = request('!.concepts.lua_table_code.save')

return
  function(data, syntax, ...)
    -- profiler.start()
    -- print(to_str(syntax))

    local input_stream = new(c_stream)
    input_stream:init(data)

    local result

    local is_parsed, data_struc = parse(input_stream, syntax)
    if is_parsed then
      result = data_struc
      for i = 1, select('#', ...) do
        local struc_transformer = select(i, ...)
        result = struc_transformer(result)
      end
    end

    local unparsed_tail
    local elems_remained =
      input_stream:get_length() - input_stream:get_position() + 1
    if (elems_remained > 0) then
      unparsed_tail = input_stream:read(elems_remained)
    end

    -- profiler.stop()

    return result, unparsed_tail
  end
