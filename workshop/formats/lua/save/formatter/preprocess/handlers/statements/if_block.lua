--[[
          <if_part>
  opt_rep <elseif_part>
  opt     <else_part>
          "end"
]]

return
  function(self, node)
    local result = {}

    result.if_part = self:process_node(node[1])

    local elseif_parts = {}
    local elseif_part_idx = 2
    while node[elseif_part_idx] and (node[elseif_part_idx].type == 'elseif_part') do
      elseif_parts[#elseif_parts + 1] = self:process_node(node[elseif_part_idx])
      elseif_part_idx = elseif_part_idx + 1
    end
    if (#elseif_parts > 0) then
      result.elseif_parts = elseif_parts
    end

    if node[elseif_part_idx] and (node[elseif_part_idx].type == 'else_part') then
      result.else_part = self:process_node(node[elseif_part_idx])
    end

    return result
  end
