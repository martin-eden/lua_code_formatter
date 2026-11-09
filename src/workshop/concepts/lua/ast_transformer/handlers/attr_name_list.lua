-- Transform attributed name list

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  Attributed name list grammar is

    opt(attr) rep(name opt(attr) ",")

  That optional first attribute is bitching us. We'll move it
  to named field.
]]

local tbl_remove = table.remove

return
  function(node)
    if (node[1].type == 'attribute') then
      node.list_attr = node[1]
      tbl_remove(node, 1)
    end
  end

--[[
  2026-10-28
]]
