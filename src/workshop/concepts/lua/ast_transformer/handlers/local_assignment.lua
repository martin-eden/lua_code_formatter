-- Change "local_assignment" record

--[[
  Author: Martin Eden
  Last mod.: 2026-10-21
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
  function(Me, Node)
    Node.name_list = Node[1]
    Node[1] = nil

    Node.val_list = Node[2]
    Node[2] = nil
  end

--[[
  2018 #
  2026-10-21
]]
