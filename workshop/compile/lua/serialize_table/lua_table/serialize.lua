return
  function(self, node, deep, parent_type)
    local string_adder = self.string_adder
    local token = self.token_giver
    local quote_string = self.quote_string

    local node_type = type(node)
    if (node_type == 'nil') then
      string_adder:add('nil')
    elseif (node_type == 'boolean') then
      string_adder:add(tostring(node))
    elseif (node_type == 'number') then
      --tostring(math.huge) -> "inf". Handle it
      if (node == math.huge) then
        string_adder:add('math.huge')
      elseif (node == -math.huge) then
        string_adder:add('-math.huge')
      else
        string_adder:add(tostring(node))
      end
    elseif (node_type == 'string') then
      local quoted_node = quote_string(node)
      if
        (parent_type == 'indexed_key') and
        quoted_node:sub(1, 1) == '['
      then
        -- Avoiding "[[[long_string]]] = 'some_value'" syntax clash
        string_adder:add(' ')
      end
      string_adder:add(quoted_node)
    elseif (node_type == 'function') then
      local node_name = self.name_giver:give_name(node)
      string_adder:add(quote_string(node_name))
    elseif (node_type == 'userdata') then
      local node_name = self.name_giver:give_name(node)
      string_adder:add(quote_string(node_name))
    elseif (node_type == 'thread') then
      local node_name = self.name_giver:give_name(node)
      string_adder:add(quote_string(node_name))
    elseif (node_type == 'table') then
      if self.name_giver.names[node] then
        string_adder:add(self.name_giver.names[node])
      else
        self.name_giver:give_name(node) --to generate and store it inside
        string_adder:add(token:open_table(deep))
        local is_first_record = true
        for k, v in self.table_iterator(node) do
          self:serialize_key_value(k, v, is_first_record, deep + 1)
          is_first_record = false
        end
        -- Do not add delimiter for empty table:
        local is_empty = is_first_record
        if not is_empty then
          string_adder:add(token:records_delimiter(deep + 1, true))
        end
        string_adder:add(token:close_table(deep, is_empty))
      end
    end
  end
