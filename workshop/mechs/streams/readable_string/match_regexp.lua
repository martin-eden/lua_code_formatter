return
  function(self, pattern)
    -- print(('match_regexp [%d, "%s"]'):format(self:get_position(), pattern))
    local start, finish, first_match = self.s:find(pattern, self:get_position())
    if start then
      self:set_position(finish + 1)
      return true, first_match
    end
  end
