-- Serialize "generic for" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
  Layout:

    for <names> in <expr_list> do
]]
local header_oneline =
  function(Me, Node)
    local Printer = Me[2]
    Printer:AddToCurline('for ')
    if not Me:ProcessNode(Node.names) then
      return
    end
    Printer:AddToCurline(' in ')
    if not Me:ProcessNode(Node.expr_list) then
      return
    end
    Printer:AddToCurline(' do')
    return true
  end

--[[
  Layout:

    [...] in <expr_list>
]]
local in_part_oneline =
  function(Me, Node)
    Me[2]:AddToCurline(' in ')
    return Me:ProcessNode(Node.expr_list)
  end

--[[
  Layout:

    [...] in
      <expr_list>
]]
local in_part_multiline =
  function(Me, Node)
    local Printer = Me[2]

    Printer:AddToTextline(' in')
    Printer:RequestCleanLine()

    return Me:ProcessBlock(Node.expr_list)
  end

--[[
  Layout:

    for
      <names><[in_part_oneline() | in_part_multiline()]>
    do
]]
local header_multiline =
  function(Me, Node)
    local Printer = Me[2]

    Printer:AddToCurline('for')

    Printer:RequestCleanLine()
    Printer:IncIndent()
    if not Me:ProcessNode(Node.names) then
      return
    end
    if not Me:Variate(Node, in_part_oneline, in_part_multiline) then
      return
    end
    Printer:DecIndent()

    Printer:RequestCleanLine()
    Printer:AddToCurline('do')

    return true
  end

--[[
  Layout:

    <[header_oneline() | header_multiline()]>
      <body>
    end
]]
local multiliner =
  function(Me, Node)
    local Printer = Me[2]

    Printer:RequestCleanLine()
    if not Me:Variate(Node, header_oneline, header_multiline) then
      return
    end

    Printer:RequestCleanLine()
    if not Me:ProcessBlock(Node.body) then
      return
    end

    Printer:RequestCleanLine()
    Printer:AddToCurline('end')

    return true
  end

return
  function(Me, Node)
    return Me:Variate(Node, nil, multiliner)
  end

--[[
  2016 #
  2017 # # #
]]
