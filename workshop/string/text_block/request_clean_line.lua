return
  function(self)
    if not self:on_clean_line() then
      self:close_line()
    end
  end
