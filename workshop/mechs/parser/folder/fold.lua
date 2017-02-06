local is_inside = request('!.mechs.geometry.1d.segments.is_inside')

return
  function(self)
    if self.is_folded then
      return
    end
    local struc = self.struc
    if (#struc >= 2) then
      local src_idx = 2
      local dest_idx = 1
      local result = {struc[1]}
      repeat
        if not is_inside(struc[src_idx], result[dest_idx]) then
          dest_idx = dest_idx + 1
          result[dest_idx] = struc[src_idx]
        else
          local start_idx = dest_idx
          repeat
            start_idx = start_idx - 1
          until
            not result[start_idx] or
            not is_inside(struc[src_idx], result[start_idx])

          start_idx = start_idx + 1
          local dest_table =
            {
              start = struc[src_idx].start,
              len = struc[src_idx].len,
              type = struc[src_idx].type,
            }
          local copy_idx = start_idx
          for i = start_idx, dest_idx do
            dest_table[#dest_table + 1] = result[i]
          end
          result[start_idx] = dest_table
          dest_idx = start_idx
        end
        src_idx = src_idx + 1
      until (src_idx > #struc)
      dest_idx = dest_idx + 1
      while result[dest_idx] do
        result[dest_idx] = nil
        dest_idx = dest_idx + 1
      end
      struc = result
    end
    --[[
      In practice fold() is called at end of processing. So
      no additiona data is going to be add to <struc>. Also
      often data is grouped to one root record. We'll unfold
      it here, breaking possibility to add additional data
      to <struc> but freeing dependent code of undolding it
      itself.
    ]]
    if (#struc == 1) then
      self.struc = struc[1]
    else
      self.struc = struc
    end
    self.is_folded = true
  end
