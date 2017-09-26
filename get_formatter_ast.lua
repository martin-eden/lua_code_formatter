local convert = request('!.file.convert')

local get_ast = request('!.lua.code.get_ast')
local formatter_preprocess = request('!.formats.lua.save.formatter.preprocess')

local parse =
  function(s)
    local result
    result = get_ast(s)
    result = formatter_preprocess(result)
    return result
  end

return
  function(f_in_name, f_out_name)
    convert(
      {
        f_in_name = f_in_name,
        f_out_name = f_out_name,
        parse = parse,
      }
    )
  end
