local assert_is_stream =
  function(t)
    assert_table(t)
    assert_function(t.get_position)
    assert_function(t.set_position)
  end

return
  function(self)
    assert_is_stream(self.input_stream)
    assert_is_stream(self.output_stream)
  end
