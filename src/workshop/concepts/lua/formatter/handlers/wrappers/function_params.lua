-- Serialize function params (names/vararg list inside "()")

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

local oneline_delimiter = ', '

local oneliner =
  function(Me, Node)
    Me.printer:AddToCurline('(')
    if not Me:process_list(Node, oneline_delimiter) then
      return
    end
    Me.printer:AddToCurline(')')
    return true
  end

local multiline_delimiter =
  function(Me)
    Me.printer:AddToTextline(',')
    Me.printer:RequestCleanLine()
  end

local multiline_block_processor =
  function(Me, Node)
    return Me:process_list_variative(Node, oneline_delimiter, multiline_delimiter)
  end

local multiliner =
  function(Me, Node)
    Me.printer:AddToCurline('(')
    Me.printer:RequestCleanLine()
    if not Me:process_block(Node, multiline_block_processor) then
      return
    end
    Me.printer:RequestCleanLine()
    Me.printer:AddToCurline(')')
    return true
  end

return
  function(Me, Node)
    if (#Node == 0) then
      Me.printer:AddToCurline('()')
      return true
    else
      return Me:variate(Node, oneliner, multiliner)
    end
  end

--[[
  2016 #
  2017 #
]]
