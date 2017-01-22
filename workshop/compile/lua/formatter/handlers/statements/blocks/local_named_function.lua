return
  function(self, node)
    self.printer:request_empty_line()
    self.printer:add_text('local function ')
    self:process_node(node.dotted_name)
    self:process_node(node.params)
    self:process_block_multiline(nil, node.body, 'end')
    self.printer:request_empty_line()
  end
