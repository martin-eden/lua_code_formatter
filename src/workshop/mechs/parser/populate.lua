-- Fill tree leaves with data

--[[
  Author: Martin Eden
  Last mod.: 2026-10-27
]]

--[[
  For all records we remove data offsets related to input stream

  This is because
    * we assume that input stream is no longer accessible in
      further flow
    * the intention of parsing is remove more low-level layer,
      not just annotate it
]]

return
  function(Node, Input)
    local populate_leaves
    populate_leaves =
      function(Node)
        if not is_table(Node) then return end

        if (#Node == 0) then
          Node[1] = Input:get_segment(Node.start, Node.len)
        else
          for _, Subnode in ipairs(Node) do
            populate_leaves(Subnode)
          end
        end
      end

    local strip_segments
    strip_segments =
      function(Node)
        if not is_table(Node) then return end

        Node.start = nil
        Node.len = nil

        for _, Subnode in ipairs(Node) do
          strip_segments(Subnode)
        end
      end

    populate_leaves(Node)
    strip_segments(Node)
  end

--[[
  2016 #
  2017 # #
  2018 #
  2026-10-20
]]
