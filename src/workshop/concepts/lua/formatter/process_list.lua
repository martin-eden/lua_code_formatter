-- Serialize node as list with delimiter

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

local apply_delimiter =
  function(Me, delimiter)
    if delimiter then
      if is_function(delimiter) then
        delimiter(Me)
      else
        Me.printer:AddToCurline(delimiter)
      end
    end
  end

return
  function(Me, Node, delimiter, apply_tail_delimiter)
    if (#Node > 0) then
      for i = 1, (#Node - 1) do
        if not Me:process_node(Node[i]) then
          return
        end
        apply_delimiter(Me, delimiter)
      end
      if not Me:process_node(Node[#Node]) then
        return
      end
      if apply_tail_delimiter then
        apply_delimiter(Me, delimiter)
      end
    end
    return true
  end

--[[
  2016 #
  2017 #
]]
