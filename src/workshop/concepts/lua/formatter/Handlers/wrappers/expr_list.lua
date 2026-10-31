-- Serialize expressions list

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

local oneline_delimiter = ', '

local oneliner =
  function(Me, Node)
    return Me:ProcessList(Node, oneline_delimiter)
  end

local multiline_delimiter =
  function(Me)
    local Printer = Me[2]
    Printer:AddToTextline(',')
    Printer:RequestCleanLine()
  end

local multiliner =
  function(Me, Node)
    Me[2]:RequestCleanLine()
    return Me:ProcessList_Variative(Node, oneline_delimiter, multiline_delimiter)
  end

return
  function(Me, Node)
    return Me:Variate(Node, oneliner, multiliner)
  end

--[[
  2016 #
  2017 #
]]
