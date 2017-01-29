--[[
  This is lua code formatter.

  It receives adjusted parsed code and produces some text result
  of it.
]]

local formatter_class = request('formatter.interface')

return
  function(data_struc, options)
    assert_table(data_struc)
    local formatter = new(formatter_class, options)
    formatter:init()
    local is_ok = formatter:process_node(data_struc)
    local result = formatter.printer:get_text()
    if not is_ok then
      result = result .. '<no_valid_representation>'
    end
    return result
  end
