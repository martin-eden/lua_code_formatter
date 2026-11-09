-- Serialize global function

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

return
  function(me, node)
    local printer = me[1]

    printer:request_clean_line()
    printer:add_to_curline('function ')
    if not me:process_node(node.dotted_name) then
      return
    end
    if node.colon_name then
      if not me:process_node(node.colon_name) then
        return
      end
    end
    if not me:process_node(node.params) then
      return
    end

    printer:request_clean_line()
    if not me:process_block_multiline(nil, node.body, 'end') then
      return
    end

    printer:request_clean_line()
    return true
  end

--[[
  2016 #
  2017 # # # #
  2026-10-28
]]
