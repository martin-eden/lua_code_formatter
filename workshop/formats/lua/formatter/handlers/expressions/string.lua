return
  function(self, node)
    --[=[
       Quite ugly handling indexing [[[s]]] case: convert to [ [[s]]].

       Pasted from [lua_table.save.install_node_handlers.minimal.
       Should remove this doubling.
    ]=]
    if not self.printer:on_clean_line() then
      local text_line = self.printer.line_with_text:get_line()
      if
        (text_line:sub(-1) == '[') and
        (node.value:sub(1, 1) == '[')
      then
        self.printer:add_curline(' ')
      end
    end

    self.printer:add_curline(node.value)
    return true
  end
