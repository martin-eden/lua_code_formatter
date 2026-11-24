-- Serialize "generic for" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
]]

--[[
  Node structure

    1 [t] -- name_list
    2 [t] -- expr_list
    3 [t] -- statements
]]

local header_oneline =
  function(me, node)
    me[1]:add_to_curline('for ')
    if not me:process_node(node[1]) then
      return
    end
    me[1]:add_to_curline(' in ')
    if not me:process_node(node[2]) then
      return
    end
    me[1]:add_to_curline(' do')
    return true
  end

local in_part_oneline =
  function(me, node)
    me[1]:add_to_curline(' in ')
    return me:process_node(node[2])
  end

local in_part_multiline =
  function(me, node)
    me[1]:add_to_textline(' in')
    me[1]:request_clean_line()

    return me:process_block(node[2])
  end

local header_multiline =
  function(me, node)
    local printer = me[1]
    printer:add_to_curline('for')

    printer:request_clean_line()
    printer:inc_indent()
    if not me:process_node(node[1]) then
      return
    end
    if not me:variate(node, in_part_oneline, in_part_multiline) then
      return
    end
    printer:dec_indent()

    printer:request_clean_line()
    printer:add_to_curline('do')

    return true
  end

local multiliner =
  function(me, node)
    me[1]:request_clean_line()
    if not me:variate(node, header_oneline, header_multiline) then
      return
    end

    me[1]:request_clean_line()
    if not me:process_block(node[3]) then
      return
    end

    me[1]:request_clean_line()
    me[1]:add_to_curline('end')

    return true
  end

return
  function(me, node)
    return me:variate(node, nil, multiliner)
  end

--[[
  2016 #
  2017 # # #
]]
