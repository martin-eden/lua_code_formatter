-- Serialize list as oneliner or multi-liner

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

return
  function(
    me,
    node,
    oneline_delimiter,
    multiline_delimiter,
    apply_tail_delimiter
  )
    if (#node == 0) then return end
    local oneliner =
      function(me, node)
        return me:process_list(node, oneline_delimiter, apply_tail_delimiter)
      end
    local multiliner =
      function(me, node)
        return me:process_list(node, multiline_delimiter, apply_tail_delimiter)
      end
    return me:variate(node, oneliner, multiliner)
  end

--[[
  2016 #
  2017 #
  2018 #
  2026-10-31
]]
