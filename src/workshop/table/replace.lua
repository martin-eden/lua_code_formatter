return
  function(dest, src)
    assert_table(dest)
    assert_table(src)
    assert(src ~= dest)
    for k in pairs(dest) do
      dest[k] = nil
    end
    for k, v in pairs(src) do
      dest[k] = v
    end
  end
