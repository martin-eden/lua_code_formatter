return
  {
    node_recs = {},
    serializer = request('^.^.lua_table.compile.interface'),

    put_qualified_key = request('put_qualified_key'),
    serialize_subtable = request('serialize_subtable'),

    init = request('init'),

    serialize = request('serialize'),
    get_result = request('get_result'),
  }
