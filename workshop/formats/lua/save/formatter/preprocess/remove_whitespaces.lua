local remove_whitespace
remove_whitespace =
  function(node)
    assert_table(node)
    for i = #node, 1, -1 do
      if (node[i].type == 'whitespace') then
        table.remove(node, i)
      end
    end
    for i = #node, 1, -1 do
      if is_table(node[i]) then
        remove_whitespace(node[i])
      end
    end
  end

return remove_whitespace
