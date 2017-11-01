local trim_linefeed = request('!.string.trim_linefeed')

return
  function(self, node)
    -- Quick workaround. Line comments includes tail newline.
    self.printer:add_curline(trim_linefeed(node.value))
    return true
  end
