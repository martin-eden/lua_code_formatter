-- Transform "numeric_for_block"

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
      <name>
      <expression>
      <expression>
  opt <expression>
      <statements>
]]

return
  function(Node)
    Node.index = Node[1]
    Node[1] = nil

    Node.start_val = Node[2]
    Node[2] = nil

    Node.end_val = Node[3]
    Node[3] = nil

    local seek_pos = 4
    if (Node[seek_pos].type == 'expression') then
      Node.increment = Node[seek_pos]
      Node[seek_pos] = nil
      seek_pos = seek_pos + 1
    end

    Node.body = Node[seek_pos]
    Node[seek_pos] = nil
    seek_pos = seek_pos + 1
  end

--[[
  2018 #
  2026-10-31
]]
