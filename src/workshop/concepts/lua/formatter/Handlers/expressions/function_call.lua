-- Serialize function call

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, Node)
    return
      Me:ProcessNode(Node.name_part) and
      Me:ProcessNode(Node.args)
  end

--[[
  2016 #
  2017 #
  2026-10-31
]]
