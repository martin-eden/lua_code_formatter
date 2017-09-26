local convert = request('!.file.convert')
local get_ast = request('!.lua.code.get_ast')

return
  function(f_in_name, f_out_name)
    convert(
      {
        f_in_name = f_in_name,
        f_out_name = f_out_name,
        parse = get_ast,
      }
    )
  end
