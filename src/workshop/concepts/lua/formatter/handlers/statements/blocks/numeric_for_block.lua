-- Serialize "numeric for" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
]]

--[[
  Node structure

    1 [t] -- name
    2 [t] -- expression (start)
    3 [t] -- expression (end)
    ?4 [t] -- expression (increment)
    * [t] -- statements
]]

return
  function(me, node)
    local printer = me[1]

    local has_increment
    local body
    do
      local seek_pos = 4
      if (node[seek_pos].type == 'expression') then
        has_increment = true
        seek_pos = seek_pos + 1
      end
      body = node[seek_pos]
    end

    printer:add_to_curline('for ')
    if not me:process_node(node[1]) then
      return
    end
    printer:add_to_curline(' = ')
    if not me:process_node(node[2]) then
      return
    end
    printer:add_to_curline(', ')
    if not me:process_node(node[3]) then
      return
    end
    if has_increment then
      printer:add_to_curline(', ')
      if not me:process_node(node[4]) then
        return
      end
    end
    printer:add_to_curline(' ')
    return me:process_block_multiline('do', body, 'end')
  end

--[[
  2016 #
  2017 # #
]]
