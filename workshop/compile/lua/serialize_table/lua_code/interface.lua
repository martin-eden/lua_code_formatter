return
  {
    serialize = request('serialize'),

    init = request('init'),
    node_recs = {},
    serializer = request('^.lua_table.interface'),
    put_qualified_key = request('put_qualified_key'),
    serialize_subtable = request('serialize_subtable'),
  }
