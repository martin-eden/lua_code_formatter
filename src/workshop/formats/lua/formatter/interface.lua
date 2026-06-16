return
  {
    right_margin = 80,
    max_text_width = 68,
    indent_chunk = '  ',

    keep_comments = true,
    keep_unparsed_tail = true,

    data_struc = nil,
    is_ok = true,

    init = request('init'),
    run = request('run'),
    get_result = request('get_result'),

    printer = request('!.mechs.text_block.interface'),
    state_keeper = request('state_keeper.interface'),

    handlers = request('handlers.interface'),

    process_list = request('process_list'),
    process_node = request('process_node'),

    process_block_oneline = request('process_block_oneline'),
    process_block_multiline = request('process_block_multiline'),
    process_block = request('process_block'),

    represent = request('represent'),
    variate = request('variate'),
    process_list_variative = request('process_list_variative'),

    representation_is_allowed = request('representation_is_allowed'),
  }

--[[
  <max_text_width> limits length of line without indent, i.e.
    length of text in line. Setting it makes sense for windowed
    viewing in editor.
  <right_margin> limits length of line with indent. Setting it
    makes sense for printring.
]]
