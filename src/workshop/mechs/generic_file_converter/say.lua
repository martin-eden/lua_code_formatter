local print_msg_with_delta_time = request('!.frontend.text.print_msg_with_delta_time')

return
  function(self, s)
    print_msg_with_delta_time(s)
  end
