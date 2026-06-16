local get_num_refs =
  function(node_rec)
    local result = 0
    if node_rec.refs then
      local node = node_rec.node
      for parent, parent_keys in pairs(node_rec.refs) do
        if (parent == node) then
          result = result + 1
        end
        for key in pairs(parent_keys) do
          if (parent[key] == node) then
            result = result + 1
          end
          if (key == node) then
            result = result + 1
          end
        end
      end
    end
    return result
  end

local may_print_inline =
  function(node_rec)
    return
      not node_rec or
      (
        (get_num_refs(node_rec) <= 1) and
        not node_rec.part_of_cycle
      )
  end

local get_assembly_order = request('!.mechs.graph.assembly_order')
local c_name_giver = request('!.mechs.name_giver')

return
  function(self, data)
    local name_giver = new(c_name_giver)
    local table_serializer = self.table_serializer
    local table_iterator = table_serializer.table_iterator

    local node_recs, nodes_ordered =
      get_assembly_order(
        data,
        {also_visit_keys = true, table_iterator = table_iterator}
      )

    local result = {}
    local processed_tables = {}

    for i = 1, #nodes_ordered do
      local node = nodes_ordered[i]
      local node_rec = node_recs[node]
      if
        not may_print_inline(node_rec) or
        (node == data)
      then
        local table_rec
        if node_rec.part_of_cycle then
          table_rec = {type = 'table'}
          for k, v in table_serializer.table_iterator(node) do
            local key_is_ok = not is_table(k) or processed_tables[k]
            local value_is_ok = not is_table(v) or processed_tables[v]
            if key_is_ok and value_is_ok then
              table_rec[#table_rec + 1] =
                {
                  key = table_serializer:get_ast(k),
                  value = table_serializer:get_ast(v),
                }
            end
          end
        else
          table_rec = table_serializer:get_ast(node)
        end
        local node_name = name_giver:give_name(node)
        result[#result + 1] =
          {
            type = 'local_definition',
            name = node_name,
            value = table_rec,
          }
        table_serializer.value_names[node] = node_name
      end
      processed_tables[node] = true

      if node_rec.part_of_cycle then
        -- Add links to a table we just processed:
        for parent, parent_keys in pairs(node_rec.refs) do
          if processed_tables[parent] then
            for parent_key in pairs(parent_keys) do
              local key_slot
              local key_name = table_serializer.value_names[parent_key]
              if key_name then
                key_slot = {type = 'name', value = key_name}
              else
                key_slot = {type = type(parent_key), value = parent_key}
              end
              result[#result + 1] =
                {
                  type = 'assignment',
                  name = table_serializer.value_names[parent],
                  index =
                    {
                      type = 'index',
                      value = key_slot,
                    },
                  value = table_serializer.value_names[node],
                }
            end
          end
        end
      end
    end

    result[#result + 1] =
      {
        type = 'return_statement',
        value = table_serializer.value_names[data],
      }

    return result
  end
