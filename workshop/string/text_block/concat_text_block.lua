return
  function(self, block, do_glue_border_lines)
    if do_glue_border_lines then
      self:add_text(block.lines[1])
      self.line_indents[#self.line_indents] = block.line_indents[1]
    else
      self.lines[#self.lines + 1] = block.lines[1]
      self.line_indents[#self.line_indents + 1] = block.line_indents[1]
    end
    for i = 2, #block.lines do
      self.lines[#self.lines + 1] = block.lines[i]
      self.line_indents[#self.line_indents + 1] = block.line_indents[i]
    end
  end
