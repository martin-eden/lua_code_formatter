return
  function(self, line_num)
    local indent_chunk_len = utf8.len(self.indent_chunk)
    local result =
      indent_chunk_len * self.line_indents[line_num] +
      (
        utf8.len(self.lines[line_num]) or
        string.len(self.lines[line_num])
      )
    return result
  end
