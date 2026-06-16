--[[
      <name>
      <expression>
      <expression>
  opt <expression>
      <statements>
]]

return
  function(self, node)
    node.index = node[1]
    node[1] = nil

    node.start_val = node[2]
    node[2] = nil

    node.end_val = node[3]
    node[3] = nil

    local seek_pos = 4
    if (node[seek_pos].type == 'expression') then
      node.increment = node[seek_pos]
      node[seek_pos] = nil
      seek_pos = seek_pos + 1
    end

    node.body = node[seek_pos]
    node[seek_pos] = nil
    seek_pos = seek_pos + 1
  end
