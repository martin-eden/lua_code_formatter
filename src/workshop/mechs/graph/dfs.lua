-- DFS-pass manager

local dfs_class = request('dfs.interface')

return
  function(graph, options)
    local dfs = new(dfs_class, options)
    dfs:run(graph)
    return dfs.nodes_status
  end
