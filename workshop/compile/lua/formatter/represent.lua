local printer_class = request('^.^.^.string.text_block.interface')

return
  function(self, representer, node)
    local original_presentation = self.printer

    local trial_presentation = new(printer_class)
    trial_presentation.indent_chunk = original_presentation.indent_chunk
    trial_presentation:init()
    local num_lines = #original_presentation.lines
    trial_presentation.lines[1] = original_presentation.lines[num_lines]
    trial_presentation.line_indents[1] = original_presentation.line_indents[num_lines]
    trial_presentation.next_line_indent = original_presentation.next_line_indent

    self.printer = trial_presentation
    local has_failed = not representer(self, node)
    self.printer = original_presentation

    return trial_presentation, has_failed
  end

