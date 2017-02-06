local empty_func = function() end

return
  {
    also_visit_keys = false,
    nodes_status = {},
    table_iterator = request('^.^.^.table.ordered_pass'),
    handle_discovery = empty_func,
    handle_leave = empty_func,
    run = request('dfs'),
  }
