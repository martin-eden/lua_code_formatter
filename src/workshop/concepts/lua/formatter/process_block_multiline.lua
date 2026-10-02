-- Serialize block as multiline with prefix and postfix

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

return
  function(Me, prefix, Node, postfix, opt_handler)
    local Printer = Me.printer

    if prefix then
      Printer:AddToCurline(prefix)
    end

    Printer:RequestCleanLine()
    local result = Me:process_block(Node, opt_handler)

    if postfix then
      Printer:RequestCleanLine()
      Printer:AddToCurline(postfix)
    end

    return result
  end

--[[
  2017 # #
]]
