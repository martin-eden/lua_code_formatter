return
  function(self)
    local result = {}

    table.insert(result, self.data_struc.shebang_str)
    table.insert(result, self.printer:get_text())
    table.insert(result, self.data_struc.unparsed_tail)
    if not self.is_ok then
      table.insert(result, '<no_valid_representation>')
    end

    result = table.concat(result, '\n')

    return result
  end
