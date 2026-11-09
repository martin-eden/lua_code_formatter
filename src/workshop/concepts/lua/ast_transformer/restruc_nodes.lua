-- Apply transformation handlers to syntax tree

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

return
  function(node, handlers)
    local restruc_nodes
    restruc_nodes =
      function(node)
        for _, subnode in ipairs(node) do
          restruc_nodes(subnode)
        end

        local handler = handlers[node.type]
        if handler then
          handler(node)
        end
      end

    restruc_nodes(node)
  end

--[[
  2018 #
  2026 # #
]]
