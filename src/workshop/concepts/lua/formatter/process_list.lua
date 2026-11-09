-- Serialize node as list with delimiter

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

local apply_delimiter =
  function(me, delimiter)
    if delimiter then
      if is_function(delimiter) then
        delimiter(me)
      else
        me[1]:add_to_curline(delimiter)
      end
    end
  end

return
  function(me, node, delimiter, apply_tail_delimiter)
    if (#node > 0) then
      for i = 1, (#node - 1) do
        if not me:process_node(node[i]) then
          return
        end
        apply_delimiter(me, delimiter)
      end
      if not me:process_node(node[#node]) then
        return
      end
      if apply_tail_delimiter then
        apply_delimiter(me, delimiter)
      end
    end
    return true
  end

--[[
  2016 #
  2017 #
]]
