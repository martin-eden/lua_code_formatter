return
  function(self, node)
    self.printer:request_clean_line()
    return self:process_block_multiline('do', node.body, 'end')
  end
