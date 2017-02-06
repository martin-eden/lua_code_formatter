return
  function(self, rule)
    local init_position = self.stream:get_position()
    for i = 1, #rule do
      if self:match(rule[i]) then
        return true
      end
      self.stream:set_position(init_position)
    end
  end
