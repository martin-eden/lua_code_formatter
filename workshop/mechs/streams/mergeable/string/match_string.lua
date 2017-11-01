return
  function(self, str)
    -- print(('match [%d, "%s"]'):format(self:get_position(), str))
    local segment = self.s:sub(self.position, self.position + #str - 1)
    if (segment == str) then
      self.position = self.position + #str
      return true
    end
  end
