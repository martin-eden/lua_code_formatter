return
  function(self, line_num)
    local line_len, text_len
    if self.lines[line_num] then
      local indent_chunk_len = utf8.len(self.indent_chunk)
      text_len =
        (
          utf8.len(self.lines[line_num]) or
          string.len(self.lines[line_num])
        )
      line_len =
        text_len + indent_chunk_len * self.line_indents[line_num]
    end
    return line_len, text_len
  end
