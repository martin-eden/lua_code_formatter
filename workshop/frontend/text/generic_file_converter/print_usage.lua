local msg_fmt =
[[
--
%s

%s
]]

return
  function(self)
    local msg = msg_fmt:format(self.description, self.usage)
    self:say(msg)
  end
