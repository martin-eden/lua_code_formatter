-- Iterator function for ordered table traversal

--[[
  Author: Martin Eden
  Last mod.: 2026-11-10
]]

local keys_comparator = request('ordered_pass.compare_keys')
local get_key_vals = request('get_key_vals')
local tbl_sort = table.sort

return
  -- Sorts table and returns iterator function
  function(table, comparator)
    assert_table(table)
    comparator = comparator or keys_comparator
    assert_function(comparator)

    local key_vals = get_key_vals(table)
    tbl_sort(key_vals, comparator)
    local i = 0

    local get_next =
      function()
        i = i + 1
        local rec = key_vals[i]
        if not rec then return end
        return rec.key, rec.value
      end

    return get_next, table
  end

--[[
  2016 # # #
  2026-11-10
]]
