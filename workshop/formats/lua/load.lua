local parse = request('^.^.mechs.generic_loader')
local syntax = request('syntax')
local postprocess_struc = request('transform.formatter')

return
  function(str)
    return parse(str, syntax, postprocess_struc)
  end
