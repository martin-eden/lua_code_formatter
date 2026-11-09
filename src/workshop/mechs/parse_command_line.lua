-- Command-line argument parser

--[[
  Author: Martin Eden
  Last mod.: 2026-11-16
]]

--[[
  Process sequence with command-line arguments.
  Return table with list of positional args and
  map of parameter values.
]]

--[[
  Input

    [t] -- arguments
      0+ [s] -- argument

  Output

    [t] -- parsed arguments
      0+ [s] -- positional argument
      <s> [s] -- key-value argument
]]

local parse_item
do
  -- "--key=value"
  local key_str_pattern = '^%-%-([%w%-]+)=(.*)$'
  local str_match = string.match
  parse_item =
    function(item)
      local str_name, str_value = str_match(item, key_str_pattern)
      if str_name then
        return true, str_name, str_value
      end
    end
end

local add_to_list = request('!.concepts.list.add_item')

return
  function(items)
    assert_table(items)
    local result = { }
    for _, item in ipairs(items) do
      assert_string(item)
      local is_ok, key, value = parse_item(item)
      if not is_ok then
        add_to_list(result, item)
        goto next
      end
      result[key] = value
      :: next ::
    end
    return result
  end

--[[
  2026-11-16
]]
