return
  function(self)
    local result = self.printer:get_text()
    if not self.is_ok then
      result = result .. '<no_valid_representation>'
    end
    return result
  end
