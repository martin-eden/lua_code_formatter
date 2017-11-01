return
  function(t)
    assert_table(t)
    local result = {}

    local unfold
    unfold =
      function(node)
        for i = 1, #node do
          if is_table(node[i]) then
            unfold(node[i])
          else
            result[#result + 1] = node[i]
          end
        end
      end

    unfold(t)

    return result
  end
