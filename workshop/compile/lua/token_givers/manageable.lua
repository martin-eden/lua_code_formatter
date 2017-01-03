return
  {
    indents_table = request('^.^.^.handy_mechs.indents_table'),
    init =
      function(self)
        self.indents_table:init()
      end,
    open_table =
      function(self, deep)
        if (deep > 0) then
          return '\n' .. self.indents_table.indents[deep] .. '{' .. '\n'
        else
          return '{' .. '\n'
        end
      end,
    close_table =
      function(self, deep, is_empty_table)
        if is_empty_table then
          return self.indents_table.indents[deep] .. '}'
        else
          return '\n' .. self.indents_table.indents[deep] .. '}'
        end
      end,
    records_delimiter =
      function(self, deep, is_last)
        if is_last then
          return ','
        else
          return ',' .. '\n'
        end
      end,
    key_indent =
      function(self, deep, is_first)
        return self.indents_table.indents[deep]
      end,
    key_prefix = '[',
    key_postfix =
      function(self, deep, key_is_table)
        if key_is_table then
          return '\n' .. self.indents_table.indents[deep] ..  ']'
        else
          return ']'
        end
      end,
    assignment = ' = ',
    commands_delimiter = '\n',
  }
