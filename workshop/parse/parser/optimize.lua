-- Optimizes compiled structures

--[[
  This module will contain optimizations for passed compiled
  structure.

  Main strategy is unfold structures with same
  flag sets. So

    {choice = true, {choice = true, 'a'}, 'a', 'b', 'c'}

  becomes

    {choice = true, 'a', 'a', 'b', 'c'}

  ---
    Implemented common-sense optimizations. They almost have no
    effect (about 1% boost). Definitions inlining yields to
    hard-to-read structures. From the other hand, "unfold-lone-child"
    improves readability.

    See no further reason to develop this module. Improving readability
    of compiled grammar is controversy motive.

    Possibly this module become sort of advisor pointing to
    possible readability shortcuts in given structure.

    2016-06-16
]]

-- local table_to_str = request('^.^.save_to.lua.serialize_table.lua_table')

local noname_children_have_same_mode =
  function(struc, mode)
    local has_nontrivial_child = false
    for i = 1, #struc do
      local term = struc[i]
      local term_mode
      if is_table(term) then
        if term.name then
          return
        end
        has_nontrivial_child = true
        term_mode = term.mode or 'seq'
      end
      term_mode = term_mode or mode
      if (term_mode ~= mode) then
        return
      end
    end
    return has_nontrivial_child
  end

local optimizations_done

local expand_children =
  function(struc)
    --[[ We should not spawn new node with children contents,
      because other parts may link to current node's table
    ]]
    assert(not struc.name)
    for i = #struc, 1, -1 do
      local term = struc[i]
      assert(not(struc.name and term.name and term.name ~= struc.name))
      struc.name = struc.name or term.name
      if is_table(term) then
        for j = #term, 1, -1 do
          table.insert(struc, i + 1, term[j])
        end
        table.remove(struc, i)
        optimizations_done = true
      end
    end
  end

local same_mode_children =
  function(struc, mode)
    local result =
      (
        (mode == 'optional') or
        (mode == 'repeat') or
        (mode == 'choice') or
        (mode == 'seq')
      ) and
      noname_children_have_same_mode(struc, mode)
    if result then
      --[[print(
        ('All children have mode "%s". Inlining them.\n%s\n---'):format(
          mode, table_to_str(struc)
        )
      )--]]
      expand_children(struc)
    end
    return result
  end

local lone_child =
  function(struc, mode)
    local result =
      (
        (mode == 'choice') or
        (mode == 'seq')
      ) and
      (#struc == 1) and
      is_table(struc[1])
    if result then
      -- print(('Struct with lone child found.\n%s\n---'):format(table_to_str(struc)))
      struc.mode = struc[1].mode
      expand_children(struc)
    end
    return result
  end

local opt_seq =
  function(struc, mode)
    local result =
      (mode == 'optional') and
      (#struc == 1) and
      is_table(struc[1]) and
      ((struc[1].mode or 'seq') == 'seq')
    if result then
      -- print(('Struct opt(seq) found.\n%s\n---'):format(table_to_str(struc)))
      expand_children(struc)
    end
    return result
  end

local optimizations =
  {
    -- same_mode_children,
    lone_child,
    opt_seq
  }

local visited

local optimize
optimize =
  function(struc)
    if
      is_table(struc) and
      not struc.name and
      not visited[struc]
    then
      visited[struc] = true
      -- local init_node_text = table_to_str(struc)

      local mode = struc.mode or 'seq'
      for i = 1, #optimizations do
        if optimizations[i](struc, mode) then
          -- print(('Node: %s'):format(init_node_text))
          -- print(('Result: %s'):format(table_to_str(struc)))
        end
      end

      for i = 1, #struc do
        optimize(struc[i])
      end
    end
  end

return
  function(struc)
    repeat
      optimizations_done = false
      visited = {}
      optimize(struc)
      --[[
      if optimizations_done then
        print('optimizations_done')
      end]]
    until not optimizations_done
    visited = {}
  end
