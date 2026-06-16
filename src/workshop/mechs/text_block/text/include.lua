return
  function(self, block, do_glue_border_lines)
    if not do_glue_border_lines then
      self:new_line()
    end
    self:store_textline()

    table.move(
      block.processed_text,
      1,
      #block.processed_text,
      #self.processed_text + 1,
      self.processed_text
    )

    self.line_with_text = block.line_with_text
  end
