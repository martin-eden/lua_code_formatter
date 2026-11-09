-- Serialize sequence of statements

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

--[[
  Each statement starts with new line, except <empty_statement> ";".
]]

local multiliner =
  function(me, node)
    for _, subnode in ipairs(node) do
      if (subnode.type ~= 'empty_statement') then
        me[1]:request_clean_line()
      end
      if not me:process_node(subnode) then
        return
      end
    end

    return true
  end

return
  function(me, node)
    return me:variate(node, nil, multiliner)
  end

--[[
  2016 #
  2017 # # # #
]]
