-- Serialize table

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

local oneliner =
  function(Me, Node)
    local Printer = Me.printer
    Printer:AddToCurline('{ ')
    for idx, KeyVal in ipairs(Node) do
      if (idx > 1) then
        Printer:AddToCurline(', ')
      end
      local key = KeyVal.key
      if key then
        if not Me:process_node(key) then
          return
        end
        Printer:AddToCurline(' = ')
      end
      if not Me:process_node(KeyVal.value) then
        return
      end
    end
    Printer:AddToCurline(' }')
    return true
  end

local multiliner =
  function(Me, Node)
    local printer = Me.printer

    printer:RequestCleanLine()
    printer:AddToCurline('{')

    printer:IncIndent()
    for _, KeyVal in ipairs(Node) do
      printer:RequestCleanLine()
      local key, value = KeyVal.key, KeyVal.value
      if key then
        if not Me:process_node(key) then
          return
        end
        printer:AddToCurline(' = ')
        if not Me:process_block(value) then
          return
        end
        printer:AddToTextline(',')
      else
        if not Me:process_node(value) then
          return
        end
        printer:AddToTextline(',')
      end
    end
    printer:DecIndent()

    printer:RequestCleanLine()
    printer:AddToCurline('}')
    return true
  end

return
  function(Me, Node)
    if (#Node == 0) then
      Me.printer:AddToCurline('{ }')
      return true
    else
      return Me:variate(Node, oneliner, multiliner)
    end
  end

--[[
  2016 #
  2017 # # #
  2018 #
]]
