-- Serialize "if" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

local oneline_if =
  function(Me, Node)
    return Me:ProcessBlock_Oneline('if ', Node, ' then')
  end

local multiline_if =
  function(Me, Node)
    return Me:ProcessBlock_Multiline('if', Node, 'then')
  end

local oneline_elseif =
  function(Me, Node)
    return Me:ProcessBlock_Oneline('elseif ', Node, ' then')
  end

local multiline_elseif =
  function(Me, Node)
    return Me:ProcessBlock_Multiline('elseif', Node, 'then')
  end

return
  function(Me, Node)
    local Printer = Me[2]

    Printer:RequestCleanLine()
    if not Me:Variate(Node.if_part.condition, oneline_if, multiline_if) then
      return
    end

    Printer:RequestCleanLine()
    if not Me:ProcessBlock(Node.if_part.body) then
      return
    end

    if Node.elseif_parts then
      for _, ElseifPart in ipairs(Node.elseif_parts) do
        Printer:RequestCleanLine()
        if
          not Me:Variate(
            ElseifPart.condition,
            oneline_elseif,
            multiline_elseif
          )
        then
          return
        end

        Printer:RequestCleanLine()
        if not Me:ProcessBlock(ElseifPart.body) then
          return
        end
      end
    end

    if Node.else_part then
      Printer:RequestCleanLine()
      if not Me:ProcessBlock_Multiline('else', Node.else_part.body) then
        return
      end
    end

    Printer:RequestCleanLine()
    Printer:AddToCurline('end')

    return true
  end

--[[
  2016 #
  2017 # # #
  2026-10-23
]]
