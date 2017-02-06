return
  function(self, rule)
    for i = 1, #rule do
      if not self:match(rule[i]) then
        return
      end
    end
    return true
  end
