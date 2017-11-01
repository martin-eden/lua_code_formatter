local get_params = request('get_ast.get_params')
local convert = request('!.file.convert')
local get_ast = request('!.lua.code.get_ast')

return
  function(args)
    local f_in_name, f_out_name = get_params(args)
    if not f_in_name then
      return
    end
    convert(
      {
        f_in_name = f_in_name,
        f_out_name = f_out_name,
        parse = get_ast,
      }
    )
  end
