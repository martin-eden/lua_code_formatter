-- Serialize "numeric for" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

return
  function(me, node)
    local printer = me[1]

    printer:add_to_curline('for ')
    if not me:process_node(node.index) then
      return
    end
    printer:add_to_curline(' = ')
    if not me:process_node(node.start_val) then
      return
    end
    printer:add_to_curline(', ')
    if not me:process_node(node.end_val) then
      return
    end
    if node.increment then
      printer:add_to_curline(', ')
      if not me:process_node(node.increment) then
        return
      end
    end
    printer:add_to_curline(' ')
    return me:process_block_multiline('do', node.body, 'end')
  end

--[[
  2016 #
  2017 # #
]]
