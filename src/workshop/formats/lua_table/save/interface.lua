return
  {
    init = request('init'),

    get_ast = request('get_ast'),
    serialize_ast = request('serialize_ast'),

    node_handlers = {},
    c_text_block = request('!.mechs.text_block.interface'),
    text_block = nil,
    value_names = {},
    table_iterator = request('!.table.ordered_pass'),
    install_node_handlers = request('install_node_handlers.readable'),
  }
