return
  {
    -- core
    allowed_params =
      {
        {name = 'f_in_name', type = 'string'},
        {name = 'f_out_name', type = 'string'},
      },
    run = request('run'),
    -- implementation
    parse_params = request('parse_params'),
    classify_item = request('classify_item'),
    get_key_name = request('get_key_name'),
    assert_type_is_correct = request('assert_type_is_correct'),
  }
