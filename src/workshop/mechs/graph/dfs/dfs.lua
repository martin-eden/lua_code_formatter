-- DFS-pass of given graph

-- Last mod.: 2024-11-24

return
  function(self, graph)
    self.nodes_status = {}

    local handle_discovery = self.handle_discovery
    local handle_leave = self.handle_leave
    local nodes_status = self.nodes_status
    local get_children = self.get_children

    local init_node_rec =
      function(node)
        nodes_status[node] = nodes_status[node] or {node = node}
      end

    local time = 0

    local dfs_visit

    local process =
      function(parent, parent_key, node, depth)
        init_node_rec(node)
        local node_rec = nodes_status[node]
        node_rec.refs = node_rec.refs or {}
        node_rec.refs[parent] = node_rec.refs[parent] or {}
        node_rec.refs[parent][parent_key] = true
        if not node_rec.color then
          node_rec.parent = parent
          node_rec.parent_key = parent_key
          dfs_visit(node, depth + 1)
        elseif (node_rec.color == 'gray') then
          node_rec.part_of_cycle = true
          nodes_status[parent].part_of_cycle = true
        end
      end

    dfs_visit =
      function(node, depth)
        time = time + 1
        local node_rec = nodes_status[node]
        node_rec.discovery_time = time
        node_rec.color = 'gray'
        handle_discovery(node, node_rec, depth)
        for _, child in ipairs(self:get_children(node)) do
          process(node, child.key, child.value, depth)
        end
        time = time + 1
        node_rec.color = 'black'
        node_rec.finish_time = time
        handle_leave(node, node_rec, depth)
      end

    init_node_rec(graph)
    dfs_visit(graph, 0)
  end

--[[
  2016
  2018
]]
