local load_lua = request('workshop.formats.lua.load')
local pretty_lua = request('workshop.formats.lua.save')

local pretty_lua_options =
  {
    indent_chunk = '  ',
    right_margin = 100,
    max_text_width = 65,
  }

local c_converter = request('workshop.mechs.generic_file_converter.interface')
return
  function(f_in_name, f_out_name)
    if
      not f_in_name or (f_in_name == '') or
      not f_out_name or (f_out_name == '')
    then
      print('Usage: <f_in> <f_out>')
      return
    end

    local converter =
      new(
        c_converter,
        {
          f_in_name = f_in_name,
          f_out_name = f_out_name,
          load_func =
            function(str)
              return load_lua(str)
            end,
          save_func =
            function(t)
              return pretty_lua(t, pretty_lua_options)
            end,
        }
      )
    converter:init()
    converter:run()
  end
