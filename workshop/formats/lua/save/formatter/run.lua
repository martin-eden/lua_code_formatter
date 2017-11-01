local preprocess = request('preprocess')

return
  function(self)
    self.data_struc = preprocess(self.data_struc, self.keep_comments)
    self.is_ok = self:process_node(self.data_struc)
  end
