return
  {
    init = request('init'),
    get_position = request('get_position'),
    set_position = request('set_position'),
    read = request('read'),
    write = request('write'),
    -- internal:
    seq = nil,
    position = nil,
  }
