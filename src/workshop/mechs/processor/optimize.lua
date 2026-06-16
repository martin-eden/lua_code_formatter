--[[

  We're inlining lone children into parents trying to get
  "saturated" record with following structure:

    --+---------+--+---------+--+----------+--
      +-| opt |-+  `-| rep |-'  `-| name |-'
      `-| neg |-'

]]

local to_str = request('!.formats.lua_table_code.save')
local assembly_order = request('!.mechs.graph.assembly_order')

local get_num_refs =
  function(node_rec)
    local result = 0
    if node_rec.refs then
      for parent, parent_keys in pairs(node_rec.refs) do
        for field in pairs(parent_keys) do
          result = result + 1
        end
      end
    end
    return result
  end

local get_first_parent =
  function(node_rec)
    local parent, child_key
    if node_rec.refs then
      parent, child_key = next(node_rec.refs)
      child_key = next(child_key)
    end
    return parent, child_key
  end

local not_both =
  function(a, b)
    return not (a and b)
  end

local modes_are_compatible =
  function(mode_a, mode_b)
    return (not mode_a and not mode_b) or (mode_a == mode_b)
  end

return
  function(grammar)
    -- print('Source grammar:')
    -- print(to_str(grammar))

    local embed =
      function(parent, child_key, node)
        parent.name = parent.name or node.name
        parent.op = parent.op or node.op
        parent.f_rep = parent.f_rep or node.f_rep
        table.remove(parent, child_key)
        for j = #node, 1, -1 do
          table.insert(parent, child_key, node[j])
        end
      end

    :: restart ::
    local node_recs, node_order = assembly_order(grammar, {table_iterator = pairs})
    for i = 1, #node_order do
      local node = node_order[i]
      -- If is rule node:
      if (#node > 0) then
        local node_rec = node_recs[node]
        if (get_num_refs(node_rec) <= 1) then
          local parent, child_key = get_first_parent(node_rec)
          if parent then
            if
              (#parent == 1) and
              not_both(parent.name, node.name) and
              modes_are_compatible(parent.mode_choice, node.mode_choice) and
              (
                (not parent.op) or
                (not node.op) or
                ((parent.op == 'opt') and (node.op == 'opt'))
              )
            then
              embed(parent, child_key, node)
            elseif
              not node.name and
              modes_are_compatible(parent.mode_choice, node.mode_choice) and
              (not parent.f_rep and not node.f_rep) and
              (not parent.op and not node.op)
            then
              embed(parent, child_key, node)
              goto restart
            end
          end
        end
      end
    end

    -- print('Optimized grammar:')
    -- print(to_str(grammar))
  end
