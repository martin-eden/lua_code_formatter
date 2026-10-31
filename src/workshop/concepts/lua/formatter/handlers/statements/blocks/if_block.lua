-- Serialize "if" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

local oneline_if =
  function(Me, Node)
    return Me:process_block_oneline('if ', Node, ' then')
  end

local multiline_if =
  function(Me, Node)
    return Me:process_block_multiline('if', Node, 'then')
  end

local oneline_elseif =
  function(Me, Node)
    return Me:process_block_oneline('elseif ', Node, ' then')
  end

local multiline_elseif =
  function(Me, Node)
    return Me:process_block_multiline('elseif', Node, 'then')
  end

return
  function(Me, Node)
    local Printer = Me[2]

    Printer:RequestCleanLine()
    if not Me:variate(Node.if_part.condition, oneline_if, multiline_if) then
      return
    end

    Printer:RequestCleanLine()
    if not Me:process_block(Node.if_part.body) then
      return
    end

    if Node.elseif_parts then
      for _, ElseifPart in ipairs(Node.elseif_parts) do
        Printer:RequestCleanLine()
        if
          not Me:variate(
            ElseifPart.condition,
            oneline_elseif,
            multiline_elseif
          )
        then
          return
        end

        Printer:RequestCleanLine()
        if not Me:process_block(ElseifPart.body) then
          return
        end
      end
    end

    if Node.else_part then
      Printer:RequestCleanLine()
      if not Me:process_block_multiline('else', Node.else_part.body) then
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
