local c_folder = request('^.folder.interface')

return
  function(self)
    local data_struc = self.marks

    local folder = new(c_folder)
    folder:init(data_struc)
    folder:fold()
    data_struc = folder:get_struc()

    return data_struc
  end
