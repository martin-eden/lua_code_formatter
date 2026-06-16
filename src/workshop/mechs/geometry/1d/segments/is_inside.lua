return
  function(seg_outer, seg_inner)
    local seg_inner_finish = seg_inner.start + seg_inner.len
    local seg_outer_finish = seg_outer.start + seg_outer.len
    return
      (seg_inner.start >= seg_outer.start) and
      (seg_inner_finish <= seg_outer_finish)
  end
