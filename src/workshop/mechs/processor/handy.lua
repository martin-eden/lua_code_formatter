-- Functions for common constructions like "choice", "repeat" etc

--[[
  Author: Martin Eden
  Last mod.: 2026-11-14
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
    return { mode_choice = true, ... }
  end

local rep =
  function(...)
    return { f_rep = true, ... }
  end

local opt =
  function(...)
    return { op = 'opt', ... }
  end

local is_not =
  function(...)
    return { op = 'neg', ... }
  end

local opt_rep =
  function(...)
    return { op = 'opt', f_rep = true, ... }
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
