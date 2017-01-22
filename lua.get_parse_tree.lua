package.path = package.path .. ';../../../../?.lua;../?.lua'
require('workshop.base')

local generic_loader = request('workshop.load_from.generic_loader')
local syntax = request('workshop.parse.syntaxes.lua')

local load =
  function(str)
    return generic_loader(str, syntax)
  end

local serialize_func = request('workshop.save_to.lua.serialize_table.lua_code')
local serialize_func_params =
  {
    serializer =
      {
        always_index_keys = false,
        token_giver = request('workshop.compile.lua.token_givers.indents_no_sugar'),
      },
  }
local save =
  function(t)
    if is_table(t) then
      return serialize_func(t, serialize_func_params)
    else
      return t
    end
  end

local convert = request('#mechs.generic_file_converter')
convert(
  {
    f_in_name = arg[1],
    f_out_name = arg[2],
    load = load,
    save = save,
  }
)
