-- Fill tree leaves with data

--[[
  Author: Martin Eden
  Last mod.: 2026-11-19
]]

--[[
  For all records we remove data offsets related to input stream

  This is because

    * we assume that input stream is no longer accessible in
      further flow
    * the intention of parsing is remove lower-level layer,
      not just annotate it
]]

return
  function(node, input)
    local populate_leaves
    populate_leaves =
      function(node)
        if not is_table(node) then return end

        if (#node == 0) then
          node[1] = input:get_segment(node.seg)
        else
          for _, subnode in ipairs(node) do
            populate_leaves(subnode)
          end
        end
      end

    local strip_segments
    strip_segments =
      function(node)
        if not is_table(node) then return end
        node.seg = nil
        for _, subnode in ipairs(node) do
          strip_segments(subnode)
        end
      end

    populate_leaves(node)
    strip_segments(node)
  end

--[[
  2016 #
  2017 # #
  2018 #
  2026 #
]]
