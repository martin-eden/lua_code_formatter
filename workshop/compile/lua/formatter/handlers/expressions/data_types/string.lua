local quote_oneline = request('^.^.^.^.quote_string')

local oneliner =
  function(self, node)
    self.printer:add_text(quote_oneline(node.value))
    return true
  end

local has_control_chars = request('^.^.^.^.^.^.string.content_attributes').has_control_chars
local quote_multiline = request('^.^.^.^.quote_string.intact')

local multiliner =
  function(self, node)
    local s = node.value
    if has_control_chars(s) then
      s = quote_multiline(s)
    else
      s = quote_oneline(s)
    end
    self.printer:add_text(s)
    return true
  end

return
  function(self, node)
    return self:variate(node, oneliner, multiliner)
  end
