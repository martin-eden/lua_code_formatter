local exists = request('!.file.exists')
local safe_open = request('!.file.safe_open')

return
  function(self)
    assert_string(self.f_in_name)
    if not exists(self.f_in_name) then
      self:error(('File "%s" not found.'):format(self.f_in_name))
    end

    assert_string(self.f_out_name)
    if (self.f_in_name == self.f_out_name) then
      self:error('Input and output file names must differ.')
    end

    -- Test that <f_out_name> is writable:
    local f_out = safe_open(self.f_out_name, 'w', true)
    if not f_out then
      self:error("Can't open output file for writing.")
    else
      f_out:close()
    end
  end
