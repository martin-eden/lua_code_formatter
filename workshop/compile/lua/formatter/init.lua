return
  function(self)
    self.indent_chunk = '  '
    self.printer.indent_chunk = self.indent_chunk
    self.printer:init()
    self.state_keeper:init()
    self.max_text_width = 60
    self.right_margin = 100
    --[[
      <max_text_width> limits length of line without indent, i.e.
        length of text in line. Setting it makes sense for windowed
        viewing in editor.
      <right_margin> limits length of line with indent. Setting it
        makes sense for printring.
    ]]
  end
