local c_folder = request('folder.interface')

return
  function(marks)
    local folder = new(c_folder)
    folder:init(marks)
    folder:fold()
    return folder:get_struc()
  end
