return
  function(self)
    local max_line_len, max_text_len = 0, 0
    for i = 1, #self.lines do
      local line_len, text_len = self:get_line_length(i)
      if (line_len > max_line_len) then
        max_line_len = line_len
      end
      if (text_len > max_text_len) then
        max_text_len = text_len
      end
    end
    return max_line_len, max_text_len
  end
