--[[
      <dot_list>
  opt <colon_name>
      <function_params>
      <statements>
]]

return
  function(self, node)
    node.dotted_name = node[1]
    node[1] = nil

    local seek_pos = 2

    if (node[seek_pos].type == 'colon_name') then
      node.colon_name = node[seek_pos]
      node[seek_pos] = nil
      seek_pos = seek_pos + 1
    end

    node.params = node[seek_pos]
    node[seek_pos] = nil
    seek_pos = seek_pos + 1

    node.body = node[seek_pos]
    node[seek_pos] = nil
    seek_pos = seek_pos + 1
  end
