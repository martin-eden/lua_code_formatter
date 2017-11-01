return
  function(self)
    self.indents_obj:init()
    self.chunk_length = string.len(self.indents_obj.indent_chunk)
  end
