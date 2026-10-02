-- Attributed name list transformation

--[[
  Author: Martin Eden
  Last mod.: 206-10-28
]]

--[[
  Attributed name list grammar is

    opt(attr) rep(name opt(attr) ",")

  That optional first attribute is bitching us. We'll move it
  to named field.
]]

local tbl_remove = table.remove

return
  function(Me, Node)
    if (Node[1].type == 'attribute') then
      Node.list_attr = Node[1]
      tbl_remove(Node, 1)
    end
  end

--[[
  2026-10-28
]]
