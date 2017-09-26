local critical_print = request('!.frontend.text.critical_print')

return
  function(self, msg)
    assert_string(msg)
    critical_print(msg)
    critical_print(self:get_state_str())
    self:print_usage()
    os.exit()
  end
