-- Transform "generic_for_block"

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
  <name_list>
  <expr_list>
  <statements>
]]

return
  function(Node)
    Node.names = Node[1]
    Node[1] = nil

    Node.expr_list = Node[2]
    Node[2] = nil

    Node.body = Node[3]
    Node[3] = nil
  end

--[[
  2018 #
  2026-10-31
]]
