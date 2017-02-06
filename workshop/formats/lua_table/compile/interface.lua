return
  {
    always_index_keys = false,
    initial_deep = 0,
    always_index_sequence = false,
    max_seq_len_keys_droppable = 15,

    name_giver = request('^.^.^.mechs.name_giver'),
    table_iterator = request('^.^.^.table.ordered_pass'),
    string_adder = request('^.^.^.mechs.string_adders.any'),
    token_giver = request('token_givers.any'),
    quote_string = request('^.^.lua.transform.quote_string'),

    serialize_key = request('serialize_key'),
    serialize_key_value = request('serialize_key_value'),

    init = request('init'),

    serialize = request('serialize'),
    get_result = request('get_result'),
  }
