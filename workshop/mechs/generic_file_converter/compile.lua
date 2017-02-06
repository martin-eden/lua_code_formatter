return
  function(self, parse_result)
    self:say('Compiling.')
    local result = self.save_func(parse_result)
    if not result then
      self:say('Compile failed.')
    else
      assert_string(result)
    end
    return result
  end
