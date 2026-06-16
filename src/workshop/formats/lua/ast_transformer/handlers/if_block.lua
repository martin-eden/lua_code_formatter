--[[
          <if_part>
  opt_rep <elseif_part>
  opt     <else_part>
]]

return
  function(self, node)
    node.if_part = node[1]
    node[1] = nil

    local seek_pos = 2

    local elseif_parts = {}
    while
      node[seek_pos] and
      (node[seek_pos].type == 'elseif_part')
    do
      elseif_parts[#elseif_parts + 1] = node[seek_pos]
      node[seek_pos] = nil
      seek_pos = seek_pos + 1
    end
    if next(elseif_parts) then
      node.elseif_parts = elseif_parts
    end

    if
      node[seek_pos] and
      (node[seek_pos].type == 'else_part')
    then
      node.else_part = node[seek_pos]
      node[seek_pos] = nil
      seek_pos = seek_pos + 1
    end
  end
