return
  function(self, node)
    local node_rec = self.node_recs[node]
    local string_adder = self.serializer.string_adder
    local token = self.serializer.token_giver

    string_adder:add('local ' .. node_rec.name .. ' = ')
    string_adder:add(token:open_table(1))
    local is_first_record = true
    for key, value in self.serializer.table_iterator(node) do
      if
        (not self.node_recs[key] or self.node_recs[key].is_defined) and
        (not self.node_recs[value] or self.node_recs[value].is_defined)
      then
        self.serializer:serialize_key_value(key, value, is_first_record, 2)
        is_first_record = false
      end
    end
    local is_empty = is_first_record
    if not is_empty then
      string_adder:add(token:records_delimiter(2, true))
    end
    string_adder:add(token:close_table(1, is_empty) .. token.commands_delimiter)
    self.node_recs[node].is_defined = true

    if node_rec.refs then
      for parent, parent_keys in pairs(node_rec.refs) do
        if self.node_recs[parent] and self.node_recs[parent].is_defined then
          assert_string(self.node_recs[parent].name)
          for parent_key in pairs(parent_keys) do
            string_adder:add(self.node_recs[parent].name)
            self:put_qualified_key(parent_key)
            string_adder:add(' = ' .. node_rec.name .. token.commands_delimiter)
          end
        end
      end
    end
  end
