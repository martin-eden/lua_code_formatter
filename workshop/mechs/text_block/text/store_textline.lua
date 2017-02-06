local trim_head_spaces = request('^.^.^.string.trim_head_spaces')
local trim_tail_spaces = request('^.^.^.string.trim_tail_spaces')

return
  function(self)
    local line_with_text = self.line_with_text

    line_with_text.text = trim_head_spaces(line_with_text.text)
    line_with_text.text = trim_tail_spaces(line_with_text.text)

    self.max_block_width = self:get_block_width()
    self.max_text_width = self:get_text_width()

    self.processed_text[#self.processed_text + 1] = line_with_text:get_line()
    for i = 1, self.num_line_feeds do
      self.processed_text[#self.processed_text + 1] = '\n'
    end
    self.num_line_feeds = 0

    line_with_text.text = ''
    line_with_text.indent = self.next_line_indent
  end
