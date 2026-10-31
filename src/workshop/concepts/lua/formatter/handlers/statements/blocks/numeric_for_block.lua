-- Serialize "numeric for" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, Node)
    local Printer = Me[2]

    Printer:AddToCurline('for ')
    if not Me:process_node(Node.index) then
      return
    end
    Printer:AddToCurline(' = ')
    if not Me:process_node(Node.start_val) then
      return
    end
    Printer:AddToCurline(', ')
    if not Me:process_node(Node.end_val) then
      return
    end
    if Node.increment then
      Printer:AddToCurline(', ')
      if not Me:process_node(Node.increment) then
        return
      end
    end
    Printer:AddToCurline(' ')
    return Me:process_block_multiline('do', Node.body, 'end')
  end

--[[
  2016 #
  2017 # #
]]
