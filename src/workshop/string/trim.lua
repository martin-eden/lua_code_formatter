local trim_head = request('trim_head')
local trim_tail = request('trim_tail')

return
  function(s)
    return trim_head(trim_tail(s))
  end
