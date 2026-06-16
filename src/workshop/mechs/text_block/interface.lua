return
  {
    -- text:
    line_with_text = request('line.interface'),
    processed_text = {},
    num_line_feeds = 0,

    store_textline = request('text.store_textline'),
    add_textline = request('text.add_textline'),
    add_curline = request('text.add_curline'),

    new_line = request('text.new_line'),
    request_clean_line = request('text.request_clean_line'),
    request_empty_line = request('text.request_empty_line'),

    on_clean_line = request('text.on_clean_line'),

    include = request('text.include'),

    get_text = request('text.get_text'),

    -- indents:
    indent_chunk = '  ',
    next_line_indent = 0,
    inc_indent = request('inc_indent'),
    dec_indent = request('dec_indent'),

    -- text length:
    max_text_width = 0,
    max_block_width = 0,
    get_text_width = request('text.get_text_width'),
    get_block_width = request('text.get_block_width'),

    init = request('init'),
  }
