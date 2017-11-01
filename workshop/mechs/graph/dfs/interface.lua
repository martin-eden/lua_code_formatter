local empty_func = function() end

return
  {
    get_children = request('get_children'),
    handle_discovery = empty_func,
    handle_leave = empty_func,
    also_visit_keys = false,
    table_iterator = request('!.table.ordered_pass'),

    run = request('dfs'),

    nodes_status = {},
  }
