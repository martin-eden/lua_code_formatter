local merge = request('!.table.merge')

local result = new(request('^.matcher.interface'))
local original_init = result.init
return
  merge(
    result,
    {
      on_match = request('on_match'),
      init = request('init'),
      get_struc = request('get_struc'),

      original_init = original_init,
      marks = nil,
    }
  )
