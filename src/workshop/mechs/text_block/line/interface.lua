return
  {
    text = '',
    indent = 0,
    indents_obj = request('^.^.indents_table'),
    chunk_length = 0,

    init = request('init'),

    get_line_length = request('get_line_length'),
    get_text_length = request('get_text_length'),
    get_line = request('get_line'),
    add = request('add'),
  }
