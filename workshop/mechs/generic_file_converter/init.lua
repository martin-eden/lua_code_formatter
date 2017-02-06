local safe_open = request('!.file.safe_open')

return
  function(self)
    assert(self.f_in_name)
    assert(self.f_out_name)

    -- Test that <f_out_name> is writable:
    local f_out = safe_open(self.f_out_name, 'w')
    f_out:close()
  end
