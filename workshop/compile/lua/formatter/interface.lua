return
  {
    right_margin = nil,
    max_text_width = nil,
    indent_chunk = nil,
    printer = new(request('^.^.^.string.text_block.interface')),
    state_keeper = new(request('state_keeper.interface')),
    init = request('init'),

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
