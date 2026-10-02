-- Remove spaces at end of string

--[[
  Author: Martin Eden
  Last mod.: 2026-05-04
]]

local trim_tail =
  function(str)
    assert_string(str)

    local read_pos = string.len(str)

    while (string.sub(str, read_pos, read_pos) == ' ') do
      read_pos = read_pos - 1
    end

    return string.sub(str, 1, read_pos)
  end

-- Export:
return trim_tail

--[[
  2017-01-20
]]
