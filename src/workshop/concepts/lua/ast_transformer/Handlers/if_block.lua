-- Transform "if_block"

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
          <if_part>
  opt_rep <elseif_part>
  opt     <else_part>
]]

return
  function(Node)
    Node.if_part = Node[1]
    Node[1] = nil

    local seek_pos = 2

    local elseif_parts = { }
    while
      Node[seek_pos] and (Node[seek_pos].type == 'elseif_part')
    do
      elseif_parts[#elseif_parts + 1] = Node[seek_pos]
      Node[seek_pos] = nil
      seek_pos = seek_pos + 1
    end
    if next(elseif_parts) then
      Node.elseif_parts = elseif_parts
    end

    if
      Node[seek_pos] and (Node[seek_pos].type == 'else_part')
    then
      Node.else_part = Node[seek_pos]
      Node[seek_pos] = nil
      seek_pos = seek_pos + 1
    end
  end

--[[
  2018 #
  2026-10-31
]]
