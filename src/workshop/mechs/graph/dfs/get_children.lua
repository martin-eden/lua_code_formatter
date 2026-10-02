-- Return list of children for given node

--[[
  Author: Martin Eden
  Last mod.: 2026-08-30
]]

--[[
  Each record in list should have fields ".key" and ".value".

  This method is assumed to be overridden for custom formats.
]]

local get_key_vals = request('!.table.get_key_vals')
local add_to_list = request('!.concepts.list.add_item')
local compare_keys = request('!.table.ordered_pass.compare_keys')
local tbl_sort = table.sort

-- Export:
return
  function(Me, Node)
    local also_visit_keys = Me.also_visit_keys
    local KeyVals = get_key_vals(Node)

    local Result = { }

    for _, Rec in ipairs(KeyVals) do
      if is_table(Rec.value) then
        add_to_list(Result, Rec)
      end
      if also_visit_keys and is_table(Rec.key) then
        add_to_list(Result, { key = Rec.key, value = Rec.key })
      end
    end

    tbl_sort(Result, compare_keys)

    return Result
  end

--[[
  2017 #
  2026 #
]]
