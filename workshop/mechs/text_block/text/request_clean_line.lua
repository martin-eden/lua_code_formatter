return
  function(self)
    if not self:on_clean_line() then
      self:new_line()
    end
  end
