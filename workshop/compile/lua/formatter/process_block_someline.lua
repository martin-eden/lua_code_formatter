return
  function(self, prefix, postfix, node)
    self:variate(
      { -- performance sink: probably may const of it
        self.process_block_oneline,
        self.process_block_multiline,
      },
      prefix,
      postfix,
      node
    )
  end
