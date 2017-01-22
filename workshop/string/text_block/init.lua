local indents_class = request('^.^.handy_mechs.indents_table')

return
  function(self)
    self.lines = {''}
    self.line_indents = {0}
    self.next_line_indent = 0

    self.indents_obj = new(indents_class)
    self.indents_obj.indent_chunk = self.indent_chunk
    self.indents_obj:init()
  end
