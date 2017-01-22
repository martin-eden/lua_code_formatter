return
  function(self)
    local result = 0
    for i = 1, #self.lines do
      local line_len = self:get_line_length(i)
      if (line_len > result) then
        result = line_len
      end
    end
    return result
  end
