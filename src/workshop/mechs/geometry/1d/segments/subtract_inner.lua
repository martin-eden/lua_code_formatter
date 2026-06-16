--[[
  Subtract inner <small> segment.

  Returs two possible <left> and <right> segments. Which may be nil.
]]

return
  function(big, small)
    local left_seg
    if (small.start > big.start) then
      left_seg =
        {
          start = big.start,
          len = small.start - big.start,
        }
    end
    local right_seg
    if (small.start + small.len < big.start + big.len) then
      right_seg =
        {
          start = small.start + small.len,
          len = (big.start + big.len) - (small.start + small.len),
        }
    end
    return left_seg, right_seg
  end
