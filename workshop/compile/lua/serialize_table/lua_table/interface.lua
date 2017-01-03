return
  {
    serialize = request('serialize'),

    init = request('init'),
    always_index_keys = false,
    name_giver = request('^.^.^.^.handy_mechs.name_giver'),
    table_iterator = request('^.^.^.^.table.ordered_pass'),
    string_adder = request('^.^.^.^.handy_mechs.string_adders').default,
    token_giver = request('^.^.token_givers').default,
    quote_string = request('^.^.quote_string'),
    serialize_key = request('serialize_key'),
    serialize_key_value = request('serialize_key_value'),
  }
