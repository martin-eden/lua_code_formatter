return
  {
    handlers = request('handlers.interface'),
    printer = request('printer.interface'),

    init = request('init'),
    process_list = request('process_list'),
    process_node = request('process_node'),
    process_block_oneline = request('process_block_oneline'),
    process_block_multiline = request('process_block_multiline'),

    variate = request('variate'),
    process_block_someline = request('process_block_someline'),

    representation_is_allowed = request('representation_is_allowed'),
  }
