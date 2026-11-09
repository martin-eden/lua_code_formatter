-- Transform "local_named_function"

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  "local_named_function" type is generated in align_nodes()

  It's "named_function" lifted from "local_statement".
]]

return
  function(node)
    node.dotted_name = node[1]
    node[1] = nil

    node.params = node[2]
    node[2] = nil

    node.body = node[3]
    node[3] = nil
  end

--[[
  2018 #
  2026-10-21
]]
