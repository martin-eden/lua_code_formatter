-- Fill tree leaves with data

--[[
  Author: Martin Eden
  Last mod.: 2026-10-20
]]

--[[
  For all records we remove data offsets related to input stream

  This is because
    * we assume that input stream is no longer accessible in
      further flow
    * the intention of parsing is remove more low-level layer,
      not just annotate it
]]

local subtract_seg = request('!.mechs.geometry.1d.segments.subtract_inner')
local add_item = request('!.concepts.list.add_item')
local tbl_insert = table.insert

return
  function(Node, InputStream)
    local get_segment =
      function(Node)
        return InputStream:get_segment(Node.start, Node.len)
      end

    local populate_leaves
    populate_leaves =
      function(Node)
        if not is_table(Node) then
          return
        end

        if (#Node == 0) then
          add_item(Node, get_segment(Node))
        else
          for i = 1, #Node do
            populate_leaves(Node[i])
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
