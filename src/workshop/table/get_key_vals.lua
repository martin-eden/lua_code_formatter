-- Return list of key-values records for given table

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

local add_to_list = request('!.concepts.list.add_item')

return
  function(table)
    assert_table(table)
    local key_vals = { }
    for key, value in pairs(table) do
      add_to_list(key_vals, { key = key, value = value })
    end
    return key_vals
  end

--[[
  2016 #
]]
