return
  {
    init = request('init'),

    get_ast = request('get_ast'),
    serialize_ast = request('serialize_ast'),

    c_table_serializer = request('!.formats.lua_table.save.interface'),
    table_serializer = nil,
    install_node_handlers = request('install_node_handlers'),
  }
