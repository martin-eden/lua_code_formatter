-- Serialize expressions list

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

local oneline_delimiter = ', '

local oneliner =
  function(me, node)
    return me:process_list(node, oneline_delimiter)
  end

local multiline_delimiter =
  function(me)
    me[1]:add_to_textline(',')
    me[1]:request_clean_line()
  end

local multiliner =
  function(me, node)
    me[1]:request_clean_line()
    return me:process_list_variative(node, oneline_delimiter, multiline_delimiter)
  end

return
  function(me, node)
    return me:variate(node, oneliner, multiliner)
  end

--[[
  2016 #
  2017 #
]]
