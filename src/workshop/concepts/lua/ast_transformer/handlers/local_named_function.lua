-- Resturcture "local_named_function"

--[[
  Author: Martin Eden
  Last mod.: 2026-10-21
]]

--[[
  "local_named_function" type is generated in align_nodes()

  It's "named_function" lifted from "local_statement".
]]

return
  function(Me, Node)
    Node.dotted_name = Node[1]
    Node[1] = nil

    Node.params = Node[2]
    Node[2] = nil

    Node.body = Node[3]
    Node[3] = nil
  end

--[[
  2018 #
  2026-10-21
]]
