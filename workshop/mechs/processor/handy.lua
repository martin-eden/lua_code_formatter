-- Handy functions for describing syntax

--[[
  This module exports syntax-sugar functions for brief and
  obvious defining common syntax constructions.
]]

local cho =
  function(...)
    local node = {...}
    node.mode_choice = true
    return node
  end

local set_repeat =
  function(...)
    local node = {...}
    node.f_rep = true
    return node
  end

local set_opt_rep =
  function(...)
    local node = {...}
    node.op = 'opt'
    node.f_rep = true
    return node
  end

local set_operand =
  function(operand)
    return
      function(...)
        local node = {...}
        node.op = operand
        return node
      end
  end

local make_list_record =
  function(...)
    local body = {...}
    assert(#body >= 2)
    local delimiter = body[#body]
    body[#body] = nil
    return {body, set_opt_rep({delimiter, body})}
  end

local interleave =
  function(t, delimiter)
    assert_table(t)
    for i = #t, 2, -1 do
      table.insert(t, i, delimiter)
    end
    return t
  end

return
  {
    cho = cho,
    is_not = set_operand('neg'),
    opt = set_operand('opt'),
    rep = set_repeat,
    opt_rep = set_opt_rep,
    list = make_list_record,
    -- interleave = interleave,
  }
