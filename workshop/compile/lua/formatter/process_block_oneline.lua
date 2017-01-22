--[[
  Process indent block witn one-line style.

  oneline samples:
    if <> then
    (<>)
    return <>

  Note the presence of " " after prefix if it ends on character
  and possibly " " before postfix.
]]

return
  function(self, prefix, node, postfix)
    local printer = self.printer

    if prefix then
      printer:add_text(prefix)
    end

    self:process_node(node)

    if postfix then
      printer:add_text(postfix)
    end
  end
