-- Serialize block as oneliner with prefix and postfix

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, prefix, Node, postfix, opt_handler)
    local Printer = Me[2]
    if prefix then
      Printer:AddToCurline(prefix)
    end
    local result = Me:process_block(Node, opt_handler)
    if postfix then
      Printer:AddToCurline(postfix)
    end
    return result
  end

--[[
  2017 # #
]]
