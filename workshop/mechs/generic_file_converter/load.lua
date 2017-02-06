local file_size = request('!.file.get_size')
local represent_size = request('!.number.represent_size')
local text_file_as_string = request('!.file.text_file_as_string')

return
  function(self)
    self:say(
      ('Loading from "%s" [%s].'):format(
        self.f_in_name,
        represent_size(file_size(self.f_in_name))
      )
    )
    return text_file_as_string(self.f_in_name)
  end
