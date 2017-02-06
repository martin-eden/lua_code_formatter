return
  function(self, key, value, is_first_record, deep)
    local string_adder = self.string_adder
    local token = self.token_giver

    if not is_first_record then
      string_adder:add(token:records_delimiter(deep))
    end
    string_adder:add(token:key_indent(deep, is_first_record))
    self:serialize_key(key, deep)
    string_adder:add(token.assignment)
    self:serialize(value, deep + 1)
  end
