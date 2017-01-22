package.path = package.path .. ';../../../../?.lua;../?.lua'
require('workshop.base')

local generic_loader = request('workshop.load_from.generic_loader')
local syntax = request('workshop.parse.syntaxes.lua_comments')
local struc_transformer = request('workshop.load_from.lua.split_comment_transformer')

local load =
  function(str)
    return generic_loader(str, syntax, struc_transformer)
  end

local save =
  function(t)
    return
      '-- comments\n' ..
      t.comments .. '\n' ..
      '-- code\n' ..
      t.code
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
