-- Handy functions for describing syntax

--[[
  This module exports syntax-sugar functions for brief and
  obvious defining common syntax constructions.
]]

local cho =
  function(...)
    local node = {...}
    node.mode = 'choice_first'
    return node
  end

local add_flags =
  function(flags)
    assert_table(flags)
    return
      function(...)
        local node = {...}
        node.flags = node.flags or {}
        for i = 1, #flags do
          node.flags[flags[i]] = true
        end
        return node
      end
  end

local is_not = add_flags({'is_not'})
local opt = add_flags({'optional'})
local rep = add_flags({'repeat'})
local opt_rep = add_flags({'optional', 'repeat'})

local make_list_record =
  function(...)
    local body = {...}
    assert(#body >= 2)
    local delimiter = body[#body]
    body[#body] = nil
    return {body, opt_rep({delimiter, body})}
  end

--TODO: drop interleave()
local interleave =
  function(t, delimiter)
    assert_table(t)
    for i = #t, 2, -1 do
      table.insert(t, i, delimiter)
    end
    return t
  end

local spawn_match_function =
  function(pattern)
    assert_string(pattern)
    assert(pattern ~= '')
    -- Place "begin-of-text" anchor:
    if (pattern:sub(1, 1) ~= '^') then
      pattern = '^' .. pattern
    end
    return
      function(stream)
        return stream:match_regexp(pattern)
      end
  end

local any_char =
  function(stream)
    return stream:block_read(1)
  end

return
  {
    cho = cho,
    is_not = is_not,
    opt = opt,
    rep = rep,
    opt_rep = opt_rep,
    list = make_list_record,
    interleave = interleave,
    match_regexp = spawn_match_function,
    any_char = any_char,
  }
