return
  {
    init = request('init'),
    -- core for implementors:
    get_position = nil,
    set_position = nil,
    read = nil,
    -- optional for implementors:
    get_length = nil,
    -- just handy:
    block_read = request('block_read'),
    get_segment = request('get_segment'),
    set_relative_position = request('set_relative_position'),
    set_next_position = request('set_next_position'),
    get_slot = request('get_slot'),
  }
