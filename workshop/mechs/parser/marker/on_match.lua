local is_inside = request('!.mechs.geometry.1d.segments.is_inside')

return
  function(self, start, stop, rule_name)
    -- print(('mark [%d .. %d] %s'):format(start, stop, rule_name))

    local marks = self.marks

    local prev_rec = marks[#marks]

    local cur_rec =
      {
        start = start,
        len = stop - start,
        type = rule_name,
      }

    if
      prev_rec and
      (start < prev_rec.start + prev_rec.len) and
      not is_inside(cur_rec, prev_rec)
    then
      prev_rec = new(prev_rec)
      while marks[#marks] and is_inside(prev_rec, marks[#marks]) do
        marks[#marks] = nil
      end
    end

    marks[#marks + 1] = cur_rec
  end
