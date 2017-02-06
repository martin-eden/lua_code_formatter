return
  function(self, node)
    -- tostring(math.huge) returns "inf". Handling it.
    if (node == math.huge) then
      self.string_adder:add('math.huge')
    elseif (node == -math.huge) then
      self.string_adder:add('-math.huge')
    else
      self.string_adder:add(tostring(node))
    end
  end
