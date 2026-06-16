local unfold = request('!.table.unfold')

return
  function(t, node_handlers)
    if is_string(t) then
      return t
    end

    assert_table(t)
    node_handlers = node_handlers or {}
    assert_table(node_handlers)

    local result = {}

    local compile
    compile =
      function(node)
        if is_string(node) then
          result[#result + 1] = node
        elseif is_table(node) then
          if node.type and node_handlers[node.type] then
            local node_handler = node_handlers[node.type]
            assert(node_handler, ('No handler found for type "%s".'):format(node.type))
            result[#result + 1] = node_handler(node)
          else
            for i = 1, #node do
              compile(node[i])
            end
          end
        end
      end

    compile(t)
    result = unfold(result)

    return table.concat(result)
  end
