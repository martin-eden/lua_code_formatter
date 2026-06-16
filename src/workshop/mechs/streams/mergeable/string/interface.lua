local merge = request('!.table.merge')
local result = new(request('^.interface'))
local original_init = result.init
return
  merge(
    result,
    {
      init = request('init'),
      get_position = request('get_position'),
      set_position = request('set_position'),
      read = request('read'),
      get_length = request('get_length'),
      -- extensions:
      match_string = request('match_string'),
      match_regexp = request('match_regexp'),
      -- internal:
      s = nil,
      position = nil,
      original_init = original_init,
    }
  )
