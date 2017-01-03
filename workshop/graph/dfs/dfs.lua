-- DFS-pass of given graph

return
  function(self, graph)
    assert_table(graph)

    self.nodes_status = {}

    local handle_discovery = self.handle_discovery
    local handle_leave = self.handle_leave
    local table_iterator = self.table_iterator
    local iterate_table_keys = self.also_visit_keys
    local nodes_status = self.nodes_status

    local time = 0

    local dfs_visit

    local process =
      function(parent, parent_key, node, deep)
        nodes_status[node] = nodes_status[node] or {}
        local node_rec = nodes_status[node]
        node_rec.refs = node_rec.refs or {}
        node_rec.refs[parent] = node_rec.refs[parent] or {}
        node_rec.refs[parent][parent_key] = true
        if not node_rec.color then
          node_rec.parent = parent
          node_rec.parent_key = parent_key
          dfs_visit(node, deep + 1)
        elseif (nodes_status[node].color == 'gray') then
          node_rec.part_of_cycle = true
          nodes_status[parent].part_of_cycle = true
        end
      end

    dfs_visit =
      function(node, deep)
        time = time + 1
        local node_rec = nodes_status[node]
        node_rec.discovery_time = time
        node_rec.color = 'gray'
        handle_discovery(node, node_rec, deep)
        for k, v in table_iterator(node) do
          if is_table(v) then
            process(node, k, v, deep)
          end
          if is_table(k) and iterate_table_keys then
            process(node, k, k, deep)
          end
        end
        time = time + 1
        node_rec.color = 'black'
        node_rec.finish_time = time
        handle_leave(node, node_rec, deep)
      end

    nodes_status[graph] = {}
    dfs_visit(graph, 0)
  end
