return
  function(self, data_str)
    self:say('Parsing.')
    local result = self.load_func(data_str)
    if not result then
      self:say('Parse failed.')
    end
    return result
  end
