return
  function(self, block, do_glue_border_lines)
    if not do_glue_border_lines then
      self:new_line()
    end
    self:store_textline()

    for i, rec in ipairs(block.processed_text) do
      table.insert(self.processed_text, rec)
    end

    self.line_with_text = block.line_with_text
  end
