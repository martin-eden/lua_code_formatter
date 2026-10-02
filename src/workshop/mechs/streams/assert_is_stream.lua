--[[
  Assert that passed argument looks like stream object.
]]

return
  function(t)
    assert_table(t)
    assert_function(t.get_position)
    assert_function(t.set_position)
  end
