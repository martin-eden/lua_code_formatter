-- Serialize function params (names/vararg list inside "()")

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

local oneline_delimiter = ', '

local oneliner =
  function(Me, Node)
    local Printer = Me[2]
    Printer:AddToCurline('(')
    if not Me:ProcessList(Node, oneline_delimiter) then
      return
    end
    Printer:AddToCurline(')')
    return true
  end

local multiline_delimiter =
  function(Me)
    local Printer = Me[2]
    Printer:AddToTextline(',')
    Printer:RequestCleanLine()
  end

local multiline_block_processor =
  function(Me, Node)
    return Me:ProcessList_Variative(Node, oneline_delimiter, multiline_delimiter)
  end

local multiliner =
  function(Me, Node)
    local Printer = Me[2]
    Me[2]:AddToCurline('(')
    Me[2]:RequestCleanLine()
    if not Me:ProcessBlock(Node, multiline_block_processor) then
      return
    end
    Me[2]:RequestCleanLine()
    Me[2]:AddToCurline(')')
    return true
  end

return
  function(Me, Node)
    if (#Node == 0) then
      Me[2]:AddToCurline('()')
      return true
    else
      return Me:Variate(Node, oneliner, multiliner)
    end
  end

--[[
  2016 #
  2017 #
]]
