local file_size = request('!.file.get_size')
local represent_size = request('!.number.represent_size')

return
  function(self)
    self:say(
      ('Loading from "%s" [%s].'):format(
        self.f_in_name,
        represent_size(file_size(self.f_in_name))
      )
    )
    local data = self.load(self.f_in_name)
    if data then
      self:say('Parsing.')
      local parse_result = self.parse(data)
      if parse_result then
        self:say('Compiling.')
        local compile_result = self.compile(parse_result)
        if compile_result then
          assert_string(compile_result)
          self:say(
            ('Saving to "%s" [%s].'):format(
              self.f_out_name,
              represent_size(#compile_result)
            )
          )
          self.save(self.f_out_name, compile_result)
        else
          self:say('Compile failed.')
        end
      else
        self:say('Parse failed.')
      end
    end
    self:say('')
  end
