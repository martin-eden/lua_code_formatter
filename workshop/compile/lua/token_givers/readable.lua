return
  {
    indents_table = request('^.^.^.handy_mechs.indents_table'),
    init =
      function(self)
        self.indents_table:init()
      end,
    open_table =
      function(self, deep)
        return '{'
      end,
    close_table =
      function(self, deep, is_empty_table)
        if is_empty_table then
          return '}'
        else
          return '\n' .. self.indents_table.indents[deep // 2] .. '}'
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
        if is_first then
          return '\n' .. self.indents_table.indents[(deep + 1) // 2]
        else
          return self.indents_table.indents[(deep + 1) // 2]
        end
      end,
    key_prefix = '[',
    key_postfix =
      function(self, deep, key_is_table)
        return ']'
      end,
    assignment = ' = ',
    commands_delimiter = '\n',
  }
