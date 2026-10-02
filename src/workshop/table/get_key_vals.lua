-- Return list of key-values records for given table

--[[
  Author: Martin Eden
  Last mod.: 2026-08-28
]]

local add_to_list = request('!.concepts.list.add_item')

-- Export:
return
  function(Table)
    assert_table(Table)

    local KeyVals = { }

    for key, value in pairs(Table) do
      add_to_list(KeyVals, { key = key, value = value })
    end

    return KeyVals
  end

--[[
  2016 #
]]
