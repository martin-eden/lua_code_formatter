local apply_delimiter =
  function(self, delimiter)
    if delimiter then
      if is_function(delimiter) then
        delimiter(self.printer)
      else
        self.printer:emit(delimiter)
      end
    end
  end

return
  function(self, node, delimiter, apply_tail_delimiter)
    if (#node > 0) then
      for i = 1, (#node - 1) do
        self:process_node(node[i])
        apply_delimiter(self, delimiter)
      end
      self:process_node(node[#node])
      if apply_tail_delimiter then
        apply_delimiter(self, delimiter)
      end
    end
  end
