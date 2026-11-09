-- Function to compare two Lua values

--[[
  Author: Martin Eden
  Last mod.: 2026-11-10
]]

--[[
  Contract

    * Compares two values of any Lua types
    * Strings have highest priority
    * Values are ordered
      * String and number values are sorted by ascending
]]

local type_rank =
  {
    ['string'] = 1,
    ['number'] = 2,
  }

local rank_other = 3

local is_comparable_type =
  {
    ['string'] = true,
    ['number'] = true,
  }

return
  function(a, b)
    local type_a = type(a)
    local rank_a = type_rank[type_a] or rank_other

    local type_b = type(b)
    local rank_b = type_rank[type_b] or rank_other

    if (rank_a ~= rank_b) then
      return (rank_a < rank_b)
    end

    if is_comparable_type[type_a] and is_comparable_type[type_b] then
      return (a < b)
    end

    return (tostring(a) < tostring(b))
  end

--[[
  2016 #
  2017 #
  2026-05-23
  2026-10-20
]]
