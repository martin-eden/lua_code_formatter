local c_sequence = request('!.mechs.streams.sequence.interface')
local c_processor = request('!.mechs.processor.core.interface')
local on_match = request('on_match')
local get_struc = request('get_struc')
local populate = request('populate')

return
  function(in_stream, struc)
    assert_table(in_stream)
    assert(is_table(struc) or is_string(struc) or is_function(struc))

    local out_stream = new(c_sequence)
    out_stream:init({})

    local processor = new(c_processor)
    processor.input_stream = in_stream
    processor.output_stream = out_stream
    processor.on_match = on_match

    processor:init()
    local is_parsed = processor:match(struc)
    local data_struc = get_struc(out_stream.seq)
    populate(data_struc, in_stream)

    return is_parsed, data_struc
  end
