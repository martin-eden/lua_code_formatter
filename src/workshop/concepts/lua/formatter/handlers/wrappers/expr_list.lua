-- Serialize expressions list

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

local oneline_delimiter = ', '

local oneliner =
  function(Me, Node)
    return Me:process_list(Node, oneline_delimiter)
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
    return Me:process_list_variative(Node, oneline_delimiter, multiline_delimiter)
  end

return
  function(Me, Node)
    return Me:variate(Node, oneliner, multiliner)
  end

--[[
  2016 #
  2017 #
]]
