-- Function to use for ordered table traversal instead of pairs()

--[[
  Author: Martin Eden
  Last mod.: 2026-08-28
]]

local keys_comparator = request('ordered_pass.compare_keys')
local get_key_vals = request('get_key_vals')
local tbl_sort = table.sort

-- Export:
return
  -- Sorts table and returns iterator function
  function(Table, comparator)
    assert_table(Table)
    comparator = comparator or keys_comparator
    assert_function(comparator)

    local KeyVals = get_key_vals(Table)
    tbl_sort(KeyVals, comparator)

    local i = 0

    local get_next =
      function()
        i = i + 1
        if KeyVals[i] then
          return KeyVals[i].key, KeyVals[i].value
        end
      end

    return get_next, Table
  end

--[[
  2016-09 # # #
]]
