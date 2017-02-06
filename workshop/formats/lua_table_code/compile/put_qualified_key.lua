local looks_like_name = request('^.^.lua.is_identifier')

return
  function(self, node)
    if looks_like_name(node) and not self.serializer.always_index_keys then
      self.serializer.string_adder:add('.' .. tostring(node))
    else
      self.serializer:serialize_key(node, 0)
    end
  end
