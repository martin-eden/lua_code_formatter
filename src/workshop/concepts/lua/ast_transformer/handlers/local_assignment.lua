-- Transform "local_assignment"

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  Sample input

    {
      type = 'local_assignment',
      [1] =
        {
          type = 'name_list',
          { type = 'name', 'a' },
          { type = 'name', 'b' },
        },
      [2] =
        {
          type = 'expr_list',
          {
            type = 'expression',
            {
              type = 'type_function',
              {
    [...]

  Sample output

    {
      type = 'local_assignment',
      name_list =
        {
          type = 'name_list',
          { type = 'name', 'a' },
          { type = 'name', 'b' },
        },
      val_list =
        {
          type = 'expr_list',
          {
            type = 'expression',
            {
              type = 'type_function',
              {
    [...]
]]

return
  function(node)
    node.name_list = node[1]
    node[1] = nil

    node.val_list = node[2]
    node[2] = nil
  end

--[[
  2018 #
  2026-10-21
]]
