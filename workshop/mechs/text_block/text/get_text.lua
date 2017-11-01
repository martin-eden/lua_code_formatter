return
  function(self)
    self:store_textline()
    local result = table.concat(self.processed_text)
    return result
  end
