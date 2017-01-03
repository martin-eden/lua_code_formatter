local string_adder = request('^.^.^.^.handy_mechs.string_adders').array

return
  {
    indent = nil,
    has_debt = nil,
    is_multiline_allowed = nil,
    text = new(string_adder),

    init = request('init'),

    emit = request('emit'),
    emit_nl = request('emit_nl'),
    request_clean_line = request('request_clean_line'),

    inc_indent = request('inc_indent'),
    dec_indent = request('dec_indent'),
    get_indent = request('get_indent'),

    get_text = request('get_text'),

    get_state = request('get_state'),
    set_state = request('set_state'),
  }
