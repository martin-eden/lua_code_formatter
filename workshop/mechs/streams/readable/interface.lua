return
  {
    init = request('init'),
    -- core:
    get_position = request('get_position'),
    set_position = request('set_position'),
    read = request('read'),
    -- just handy:
    block_read = request('block_read'),
    get_segment = request('get_segment'),
    match = request('match'),
    set_relative_position = request('set_relative_position'),
    set_next_position = request('set_next_position'),
    see_next_chunk = request('see_next_chunk'),
    -- core for implementors:
    raw_get_position = request('raw_get_position'),
    raw_set_position = request('raw_set_position'),
    raw_read = request('raw_read'),
    -- optional for implementors:
    match_regexp = request('match_regexp'),
    -- internal:
    position = nil,
    cached_chunks = nil,
  }
