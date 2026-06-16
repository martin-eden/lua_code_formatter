--[[
  Try to find regexp pattern from current position in stream.
  If found,
    set position past last character in found pattern,
    return capture
  else
    return nothing
]]

return
  function(self, pattern)
    -- print(('match_regexp [%d, "%s"]'):format(self:get_position(), pattern))
    local start, finish = self.s:find(pattern, self:get_position())
    if start then
      self:set_position(finish + 1)
      return self.s:sub(start, finish)
    end
  end
