local represent_size = request('!.number.represent_size')
local safe_open = request('!.file.safe_open')

return
  function(self, compile_result)
    self:say(
      ('Saving to "%s" [%s].'):format(
        self.f_out_name,
        represent_size(#compile_result)
      )
    )
    local f_out = safe_open(self.f_out_name, 'w')
    f_out:write(compile_result)
    f_out:close()
  end
