local printer_class = request('^.^.^.^.mechs.text_block.interface')

return
  function(self, representer, node)
    local original = self.printer

    local trial = new(printer_class)

    trial.indent_chunk = original.indent_chunk
    trial:init()

    trial.line_with_text.indent = original.line_with_text.indent
    if not original:on_clean_line() then
      trial.line_with_text.text = original.line_with_text.text
    end

    trial.next_line_indent = original.next_line_indent

    self.printer = trial
    local has_failed = not representer(self, node)
    self.printer = original

    return trial, has_failed
  end

