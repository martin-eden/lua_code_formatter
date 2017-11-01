return
  function(self)
    if not self:on_clean_line() then
      self:new_line()
    end
    if (self.num_line_feeds == 1) then
      self:new_line()
    end
  end
