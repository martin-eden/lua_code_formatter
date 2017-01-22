return
  function(self)
    local prev_line = self.lines[#self.lines - 1] or ''
    if (prev_line ~= '') then
      self:request_clean_line()
      self:close_line()
    end
  end
