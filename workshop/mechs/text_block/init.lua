return
  function(self)
    self.processed_text = {}

    self.line_with_text.indents_obj.indent_chunk = self.indent_chunk
    self.line_with_text:init()
    self.line_with_text.indent = self.next_line_indent

    self.num_line_feeds = 0
  end
