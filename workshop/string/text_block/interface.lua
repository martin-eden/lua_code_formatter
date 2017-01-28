--[[
  This is interface for block of several text lines. Like

    "local k = 1"
    "for i = 1, n do"
    "  k = k * i"
    "end"
    ""
    "print(k)"

  This class will export next operations for such blocks:

    lines[] -- read-only
    add_line(s)
    add_text(s) -- text to concat to last line

  Intention is to store representations of formatted code and
  indent blocks.
]]

return
  {
    lines = nil,
    next_line_indent = nil,
    line_indents = nil,
    indent_chunk = nil,
    indents_obj = nil,

    init = request('init'),

    close_line = request('close_line'),
    add_text = request('add_text'),
    add_to_prev_text = request('add_to_prev_text'),

    on_clean_line = request('on_clean_line'),
    request_clean_line = request('request_clean_line'),
    request_empty_line = request('request_empty_line'),

    inc_indent = request('inc_indent'),
    dec_indent = request('dec_indent'),
    update_indent = request('update_indent'),

    get_text = request('get_text'),
    get_line_length = request('get_line_length'),
    get_text_width = request('get_text_width'),

    concat_text_block = request('concat_text_block'),
  }
