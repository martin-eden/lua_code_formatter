return
  function(self, node)
    if not node.expr_list then
      self.printer:emit('return')
    else
      self:process_block_oneline('return', nil, node.expr_list)
    end
  end
