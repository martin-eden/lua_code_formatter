-- Serialize "generic for" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

--[[
  Layout:

    for <names> in <expr_list> do
]]
local header_oneline =
  function(me, node)
    me[1]:add_to_curline('for ')
    if not me:process_node(node.names) then
      return
    end
    me[1]:add_to_curline(' in ')
    if not me:process_node(node.expr_list) then
      return
    end
    me[1]:add_to_curline(' do')
    return true
  end

--[[
  Layout:

    [...] in <expr_list>
]]
local in_part_oneline =
  function(me, node)
    me[1]:add_to_curline(' in ')
    return me:process_node(node.expr_list)
  end

--[[
  Layout:

    [...] in
      <expr_list>
]]
local in_part_multiline =
  function(me, node)
    me[1]:add_to_textline(' in')
    me[1]:request_clean_line()

    return me:process_block(node.expr_list)
  end

--[[
  Layout:

    for
      <names><[in_part_oneline() | in_part_multiline()]>
    do
]]
local header_multiline =
  function(me, node)
    local printer = me[1]
    printer:add_to_curline('for')

    printer:request_clean_line()
    printer:inc_indent()
    if not me:process_node(node.names) then
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

--[[
  Layout:

    <[header_oneline() | header_multiline()]>
      <body>
    end
]]
local multiliner =
  function(me, node)
    me[1]:request_clean_line()
    if not me:variate(node, header_oneline, header_multiline) then
      return
    end

    me[1]:request_clean_line()
    if not me:process_block(node.body) then
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
