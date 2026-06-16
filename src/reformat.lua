local get_params = request('reformat.get_params')
local get_ast = request('!.lua.code.get_ast')
local serialize_ast = request('!.lua.code.ast_as_code')
local convert = request('!.file.convert')

return
  function(args)
    local f_in_name, f_out_name, formatter_options = get_params(args)
    if not f_in_name then
      return
    end
    convert(
      {
        f_in_name = f_in_name,
        f_out_name = f_out_name,
        parse = get_ast,
        compile =
          function(struc)
            return serialize_ast(struc, formatter_options)
          end,
      }
    )
  end
