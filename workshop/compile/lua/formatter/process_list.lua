local apply_delimiter =
  function(self, delimiter)
    if delimiter then
      if is_function(delimiter) then
        delimiter(self)
      else
        self.printer:add_text(delimiter)
      end
    end
  end

return
  function(self, node, delimiter, apply_tail_delimiter)
    if (#node > 0) then
      for i = 1, (#node - 1) do
        if not self:process_node(node[i]) then
          return
        end
        apply_delimiter(self, delimiter)
      end
      if not self:process_node(node[#node]) then
        return
      end
      if apply_tail_delimiter then
        apply_delimiter(self, delimiter)
      end
    end
    return true
  end
