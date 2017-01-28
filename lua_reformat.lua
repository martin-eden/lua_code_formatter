local load_lua = request('workshop.load_from.lua')
local pretty_lua = request('workshop.save_to.lua')

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
            return pretty_lua(t)
          end,
      }
    )
  end
