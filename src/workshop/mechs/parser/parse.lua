-- Match and capture input stream given grammar tree

--[[
  Author: Martin Eden
  Last mod.: 2026-10-27
]]

local OutputSequence = request('!.mechs.streams.sequence.interface')
local DataProcessor = request('!.mechs.processor.core.interface')

local on_match =
  function(Input, Output, name, init_pos)
    local length = Input:get_position() - init_pos
    if (length == 0) then return end
    Output:write({ type = name, start = init_pos, len = length })
  end

local get_struc = request('get_struc')
local populate = request('populate')

return
  function(Input, Grammar)
    assert_table(Input)
    assert(is_table(Grammar) or is_string(Grammar) or is_function(Grammar))

    local Output = new(OutputSequence)
    Output:init({ })

    local Processor = new(DataProcessor)
    Processor.input_stream = Input
    Processor.output_stream = Output
    Processor.on_match = on_match

    Processor:init()
    local is_parsed = Processor:match(Grammar)
    local Data = get_struc(Output.seq)
    populate(Data, Input)

    return is_parsed, Data
  end

--[[
  2016 #
  2017 # # # # # #
  2018 #
]]
