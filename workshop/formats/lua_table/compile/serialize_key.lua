local is_identifier = request('^.^.lua.is_identifier')

return
  function(self, key, deep)
    local string_adder = self.string_adder
    local token = self.token_giver

    if is_identifier(key) and not self.always_index_keys then
      string_adder:add(key)
    else
      string_adder:add(token.key_prefix)
      self:serialize(key, deep + 1, 'indexed_key')
      string_adder:add(token:key_postfix(deep, is_table(key)))
    end
  end
