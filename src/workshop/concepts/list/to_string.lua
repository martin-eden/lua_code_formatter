-- Concatenate list of string values to string

--[[
  Author: Martin Eden
  Last mod.: 2026-08-28
]]

local tbl_concat = table.concat

-- Export:
return
  function(List, separator_str)
    assert_table(List)
    separator_str = separator_str or ''
    assert_string(separator_str)

    return tbl_concat(List, separator_str)
  end

--[[
  2024 # #
  2026-05-29
]]
