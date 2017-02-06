return
  function(self, node)
    local node_name = self.name_giver:give_name(node)
    self.string_adder:add(self.quote_string(node_name))
  end
