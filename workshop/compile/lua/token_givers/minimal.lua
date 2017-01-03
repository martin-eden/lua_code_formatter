return
  {
    indents_table = request('^.^.^.handy_mechs.indents_table'),
    init =
      function(self)
      end,
    open_table =
      function(self, deep)
        return '{'
      end,
    close_table =
      function(self, deep, is_empty_table)
        return '}'
      end,
    records_delimiter =
      function(self, deep, is_last)
        if is_last then
          return ''
        else
          return ','
        end
      end,
    key_indent =
      function(self, deep, is_first)
        return ''
      end,
    key_prefix = '[',
    key_postfix =
      function(self, deep, key_is_table)
        return ']'
      end,
    assignment = '=',
    commands_delimiter = '\n',
  }
