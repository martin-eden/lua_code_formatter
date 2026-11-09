-- Return list of children for given node

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

--[[
  Each record in list should have fields ".key" and ".value".

  This method is assumed to be overridden for custom formats.
]]

local get_key_vals = request('!.table.get_key_vals')
local add_to_list = request('!.concepts.list.add_item')
local compare_keys = request('!.table.ordered_pass.compare_keys')
local tbl_sort = table.sort

return
  function(me, node)
    local also_visit_keys = me.also_visit_keys
    local key_vals = get_key_vals(node)

    local result = { }

    for _, rec in ipairs(key_vals) do
      if is_table(rec.value) then
        add_to_list(result, rec)
      end
      if also_visit_keys and is_table(rec.key) then
        add_to_list(result, { key = rec.key, value = rec.key })
      end
    end

    tbl_sort(result, compare_keys)

    return result
  end

--[[
  2017 #
  2026 #
]]
