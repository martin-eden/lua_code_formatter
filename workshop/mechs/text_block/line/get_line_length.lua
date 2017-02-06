return
  function(self)
    return self.indent * self.chunk_length + self:get_text_length()
  end
