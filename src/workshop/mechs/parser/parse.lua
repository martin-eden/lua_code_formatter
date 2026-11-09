-- Match and capture input stream given grammar tree

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

local output_seq = request('!.mechs.streams.sequence.interface')
local data_processor = request('!.mechs.processor')

local on_match =
  function(input, output, name, init_pos)
    local length = input:get_position() - init_pos
    if (length == 0) then return end
    output:write({ type = name, start = init_pos, len = length })
  end

local fold = request('fold')
local populate = request('populate')

return
  function(input, grammar)
    assert_table(input)
    assert(is_table(grammar) or is_string(grammar) or is_function(grammar))

    local output = new(output_seq)
    output:init({ })

    local processor = data_processor.create(input, output, on_match)

    local is_parsed = processor:match(grammar)

    local data = fold(output.seq)
    populate(data, input)

    return is_parsed, data
  end

--[[
  2016 #
  2017 # # # # # #
  2018 #
]]
