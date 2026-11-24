-- Serialize function

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
]]

local multiliner =
  function(me, node)
    local params = node[1]
    local body = node[2]
    me[1]:request_clean_line()
    me[1]:add_to_curline('function')
    if not me:process_node(params) then
      return
    end
    me[1]:request_clean_line()
    return me:process_block_multiline(nil, body, 'end')
  end

return
  function(me, node)
    return me:variate(node, nil, multiliner)
  end

--[[
  2016 #
  2017 # # #
]]
