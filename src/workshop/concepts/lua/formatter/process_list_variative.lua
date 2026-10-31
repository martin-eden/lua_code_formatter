-- Serialize list as oneliner or multi-liner

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(
    Me,
    Node,
    oneline_delimiter,
    multiline_delimiter,
    apply_tail_delimiter
  )
    if (#Node == 0) then return end
    local oneliner =
      function(Me, Node)
        return Me:ProcessList(Node, oneline_delimiter, apply_tail_delimiter)
      end
    local multiliner =
      function(Me, Node)
        return Me:ProcessList(Node, multiline_delimiter, apply_tail_delimiter)
      end
    return Me:Variate(Node, oneliner, multiliner)
  end

--[[
  2016 #
  2017 #
  2018 #
  2026-10-31
]]
