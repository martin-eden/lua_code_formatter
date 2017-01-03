local parse = request('generic_loader')
local syntax = request('^.parse.syntaxes.lua')
local postprocess_struc = request('^.parse.lua.formatter')

return
  function(str)
    return parse(str, syntax, postprocess_struc)
  end
