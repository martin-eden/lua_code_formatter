local pretty_lua_options =
  {
    indent_chunk = '  ',
    right_margin = 100,
    max_text_width = 65,
    keep_comments = true,
  }

local serialize_ast = request('!.formats.lua.save')
local pretty_lua =
  function(struc)
    return serialize_ast(struc, pretty_lua_options)
  end

local get_ast = request('!.lua.code.get_ast')
local convert = request('!.file.convert')

return
  function(f_in_name, f_out_name)
    convert(
      {
        f_in_name = f_in_name,
        f_out_name = f_out_name,
        description = 'Reformat Lua 5.3 code.',
        parse = get_ast,
        compile = pretty_lua,
      }
    )
  end
