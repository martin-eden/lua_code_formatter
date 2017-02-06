return
  function(self, node, deep)
    local string_adder = self.string_adder
    local token_giver = self.token_giver

    if self.name_giver.names[node] then
      string_adder:add(self.name_giver.names[node])
    else
      self.name_giver:give_name(node) --to generate and store it inside
      string_adder:add(token_giver:open_table(deep))
      local is_first_record = true

      local skip_seq_keys_allowed =
        false and
        not self.always_index_sequence and
        (#node < self.max_seq_len_keys_droppable)
      local last_seq_key = 0
      for k, v in self.table_iterator(node) do
        if
          skip_seq_keys_allowed and
          is_integer(k) and
          (k == last_seq_key + 1)
        then
          if not is_first_record then
            string_adder:add(token_giver:records_delimiter(deep + 1))
          end
          string_adder:add(token_giver:key_indent(deep + 1, is_first_record))
          self:serialize(v, deep + 1)
          last_seq_key = k
        else
          self:serialize_key_value(k, v, is_first_record, deep + 1)
        end
        is_first_record = false
      end

      -- Do not add delimiter for empty table:
      local is_empty = is_first_record
      if not is_empty then
        string_adder:add(token_giver:records_delimiter(deep + 1, true))
      end
      string_adder:add(token_giver:close_table(deep, is_empty))
    end
  end
