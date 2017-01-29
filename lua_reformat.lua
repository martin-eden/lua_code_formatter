local load_lua = request('workshop.load_from.lua')
local pretty_lua = request('workshop.save_to.lua')

local pretty_lua_options =
  {
    indent_chunk = '  ',
    right_margin = 100,
    max_text_width = 65,
  }

local convert = request('#mechs.generic_file_converter')
return
  function(f_in_name, f_out_name)
    convert(
      {
        f_in_name = f_in_name,
        f_out_name = f_out_name,
        load =
          function(str)
            return load_lua(str)
          end,
        save =
          function(t)
            return pretty_lua(t, pretty_lua_options)
          end,
      }
    )
  end
