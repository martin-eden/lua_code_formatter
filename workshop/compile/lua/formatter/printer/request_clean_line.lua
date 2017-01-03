return
  function(self)
    if not self.on_clean_line then
      self:emit_nl()
    end
  end
