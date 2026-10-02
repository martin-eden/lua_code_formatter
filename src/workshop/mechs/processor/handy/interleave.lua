return
  function(t, delimiter)
    assert_table(t)
    for i = #t, 2, -1 do
      table.insert(t, i, delimiter)
    end
    return t
  end
