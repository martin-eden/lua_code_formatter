-- Transform "named_function"

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
      <dot_list>
  opt <colon_name>
      <function_params>
      <statements>
]]

return
  function(Node)
    Node.dotted_name = Node[1]
    Node[1] = nil

    local seek_pos = 2

    if (Node[seek_pos].type == 'colon_name') then
      Node.colon_name = Node[seek_pos]
      Node[seek_pos] = nil
      seek_pos = seek_pos + 1
    end

    Node.params = Node[seek_pos]
    Node[seek_pos] = nil
    seek_pos = seek_pos + 1

    Node.body = Node[seek_pos]
    Node[seek_pos] = nil
    seek_pos = seek_pos + 1
  end

--[[
  2018 #
  2026-10-31
]]
