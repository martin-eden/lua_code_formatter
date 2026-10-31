-- Serialize "local_named_function"

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, Node)
    local Printer = Me[2]

    Printer:RequestCleanLine()
    Printer:AddToCurline('local function ')
    if not Me:process_node(Node.dotted_name) then
      return
    end
    if not Me:process_node(Node.params) then
      return
    end

    Printer:RequestCleanLine()
    if not Me:process_block_multiline(nil, Node.body, 'end') then
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
