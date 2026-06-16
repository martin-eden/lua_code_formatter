local trim_linefeed = request('!.string.trim_linefeed')

return
  function(self, node)
    --[[
      Line comments includes tail newline. Newline is automatically
      added after any statement. Comment considered statement.

      So quick fix is trim tail newline from comment.
    ]]
    self.printer:add_curline(trim_linefeed(node.value))
    return true
  end
