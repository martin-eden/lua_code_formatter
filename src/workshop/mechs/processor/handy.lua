-- Functions for common constructions like "choice", "repeat" etc

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

--[[
  Handy functions for describing common constructions as "choice",
  "optional", "repeat", "not", "list" (like comma-separated values).

  "interleave" was experimental function to generate striped table:
  ({a, b}, ',') -> {a, ',', b, ','}. Currently not used and probably
  will be dropped.
]]

local cho =
  function(...)
    local result = { ... }
    result.mode_choice = true
    return result
  end

local rep =
  function(...)
    local result = { ... }
    result.f_rep = true
    return result
  end

local opt =
  function(...)
    local result = { ... }
    result.op = 'opt'
    return result
  end

local is_not =
  function(...)
    local result = { ... }
    result.op = 'neg'
    return result
  end

local opt_rep =
  function(...)
    local result = { ... }
    result.op = 'opt'
    result.f_rep = true
    return result
  end

local list =
  function(...)
    local body = { ... }
    assert(#body >= 2)
    local delimiter = body[#body]
    body[#body] = nil
    return { body, opt_rep(delimiter, body) }
  end

local interleave
do
  local tbl_insert = table.insert
  interleave =
    function(t, delimiter)
      assert_table(t)
      for i = #t, 2, -1 do
        tab_insert(t, i, delimiter)
      end
      return t
    end
end

return
  {
    cho = cho,
    rep = rep,
    opt = opt,
    is_not = is_not,
    opt_rep = opt_rep,
    list = list,
    interleave = interleave,
  }

--[[
  2018
  2026-11-12
]]
