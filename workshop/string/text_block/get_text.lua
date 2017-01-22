return
  function(self)
    local result = {}
    for i = 1, #self.lines do
      result[i] =
        -- ('[%s]'):format(self.line_indents[i]) ..
        self.indents_obj.indents[self.line_indents[i]] ..
        self.lines[i]
    end
    result = table.concat(result, '\n')
    return result
  end
