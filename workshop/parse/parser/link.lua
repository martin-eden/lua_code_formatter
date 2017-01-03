-- Generate final structure for parser

--[[
  This module takes almost-ready structure and finalizes it
  by resolving links.
]]

local pass_graph = request('^.^.graph.dfs')

local is_producer =
  function(node)
    if node.inner_name then
      -- print('This is producer.')
    end
    return node.inner_name
  end

local ref_pattern = '^%>(%a[%a%d_]*)$' -- Sample: >dig_base_10

local is_consumer =
  function(node)
    local result
    for i = 1, #node do
      if is_string(node[i]) then
        local ref_name = node[i]:match(ref_pattern)
        if ref_name then
          result = true
          break
        end
      end
    end
    if result then
      -- print('This is consumer.')
    end
    return result
  end

local add_producer =
  function(node, producers)
    local name = node.inner_name
    if producers[name] then
      -- print(('Already have producer with name "%s".'):format(name))
    else
      producers[name] = node
      -- print(('Added producer "%s".'):format(name))
    end
  end

local add_consumer =
  function(node, consumers)
    local name = node.name or node.inner_name or tostring(node)
    if consumers[node] then
      -- print(('Already have consumer "%s.".'):format(name))
    else
      consumers[node] = node
      -- print(('Added consumer "%s".'):format(name))
    end
  end

local resolve_links =
  function(node, producers)
    local has_unresolved_links
    for i = 1, #node do
      if is_string(node[i]) then
        local ref_name = node[i]:match(ref_pattern)
        if ref_name then
          if producers[ref_name] then
            node[i] = producers[ref_name]
          else
            has_unresolved_links = true
          end
        end
      end
    end
    return not has_unresolved_links
  end

return
  function(node, producers, consumers)
    local producers = producers or {}
    local consumers = consumers or {}
    pass_graph(
      node,
      {
        handle_discovery =
          function(node, node_rec, deep)
            local node_name = node.name or node.inner_name or tostring(node)
            if is_producer(node) then
              add_producer(node, producers)
            end
            if is_consumer(node) then
              add_consumer(node, consumers)
            end
          end,
      }
    )
    for k, v in pairs(consumers) do
      if resolve_links(v, producers) then
        consumers[k] = nil
      end
    end

    --[[
    print('producers:')
    for k, v in pairs(producers) do
      print(k)
    end

    print('consumers:')
    for k, v in pairs(consumers) do
      print(tostring(k))
    end
    --]]
    return producers, consumers
  end
