-- Serialize global function

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, Node)
    local Printer = Me[2]

    Printer:RequestCleanLine()
    Printer:AddToCurline('function ')
    if not Me:ProcessNode(Node.dotted_name) then
      return
    end
    if Node.colon_name then
      if not Me:ProcessNode(Node.colon_name) then
        return
      end
    end
    if not Me:ProcessNode(Node.params) then
      return
    end

    Printer:RequestCleanLine()
    if not Me:ProcessBlock_Multiline(nil, Node.body, 'end') then
      return
    end

    Printer:RequestCleanLine()
    return true
  end

--[[
  2016 #
  2017 # # # #
  2026-10-28
]]
