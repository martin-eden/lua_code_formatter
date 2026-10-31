-- Serialize "numeric for" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, Node)
    local Printer = Me[2]

    Printer:AddToCurline('for ')
    if not Me:ProcessNode(Node.index) then
      return
    end
    Printer:AddToCurline(' = ')
    if not Me:ProcessNode(Node.start_val) then
      return
    end
    Printer:AddToCurline(', ')
    if not Me:ProcessNode(Node.end_val) then
      return
    end
    if Node.increment then
      Printer:AddToCurline(', ')
      if not Me:ProcessNode(Node.increment) then
        return
      end
    end
    Printer:AddToCurline(' ')
    return Me:ProcessBlock_Multiline('do', Node.body, 'end')
  end

--[[
  2016 #
  2017 # #
]]
