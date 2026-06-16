local subtract_seg = request('!.mechs.geometry.1d.segments.subtract_inner')

local process =
  function(data_struc, in_stream)

    local get_segment =
      function(node)
        return in_stream:get_segment(node.start, node.len)
      end

    local populate
    populate =
      function(node)
        if not is_table(node) then
          return
        end
        local outer_seg = node
        local i = 1
        while (i <= #node) and outer_seg do
          local l_seg, r_seg = subtract_seg(outer_seg, node[i])
          local seg_val
          if l_seg then
            seg_val = get_segment(l_seg)
            table.insert(node, i, seg_val)
            i = i + 1
          end
          outer_seg = r_seg
          i = i + 1
        end
        if outer_seg then
          seg_val = get_segment(outer_seg)
          table.insert(node, i, seg_val)
        end
        for i = 1, #node do
          populate(node[i])
        end
        node.start = nil
        node.len = nil
      end

    if next(data_struc) then
      populate(data_struc)
    end
  end

return process

--[[
  * For all records we remove data offsets related to input stream.

    This is because
      * we assume that input stream is no longer accessible in
        further flow
      * the intention of parsing is remove more low-level layer,
        not just annotate it
]]
