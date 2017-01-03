-- Handy functions for describing syntax

--[[
  This module exports syntax-sugar functions for brief and
  obvious defining common syntax constructions.
]]

local generate_record =
  function(mode)
    return
      function(...)
        local result = {...}
        local is_first_term = true
        for flag in mode:gmatch('[%a_]+') do
          if not is_first_term then
            result = {result}
          end
          result.mode = flag
          is_first_term = false
        end
        return result
      end
  end

local generate_list_record =
  function(...)
    local list = {...}
    assert(#list >= 2)
    local delim = list[#list]
    list[#list] = nil
    local result =
      {
        list,
        generate_record('repeat optional')({delim, list})
      }
    return result
  end

--TODO: drop interleave()
local interleave =
  function(t, delim)
    assert_table(t)
    for i = #t, 2, -1 do
      table.insert(t, i, delim)
    end
    return t
  end

local spawn_pattern_function =
  function(pattern)
    assert_string(pattern)
    assert(pattern ~= '')
    -- Place "begin-of-text" anchor:
    if (pattern:sub(1, 1) ~= '^') then
      pattern = '^' .. pattern
    end
    return
      function(s, s_pos)
        local start, finish = s:find(pattern, s_pos)
        if start then
          return true, finish + 1
        end
      end
  end

return
  {
    opt = generate_record('optional'),
    rep = generate_record('repeat'),
    cho = generate_record('choice_best'),
    cho1 = generate_record('choice_first'),
    rep_cho = generate_record('choice_best repeat'),
    list = generate_list_record,
    interleave = interleave,
    opt_rep = generate_record('repeat optional'),
    opt_cho = generate_record('choice_best optional'),
    opt_rep_cho = generate_record('choice_best repeat optional'),
    is_not = generate_record('is_not'),
    match_pattern = spawn_pattern_function,
  }
