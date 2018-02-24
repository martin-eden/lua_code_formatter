local transform_ast = request('!.formats.lua.transform_ast')

return
  function(self)
    self.data_struc =
      transform_ast(
        self.data_struc,
        {
          keep_comments = self.keep_comments,
          keep_unparsed_tail = self.keep_unparsed_tail,
        }
      )
    self.is_ok = self:process_node(self.data_struc)

    return self:get_result()
  end
