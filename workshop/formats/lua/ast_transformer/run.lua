return
  function(self)
    assert_table(self.data_struc)

    local result = self.data_struc

    if self.keep_comments then
      self:move_comments()
    end
    self:align_nodes(result)
    self:restruc_nodes(result)
    if not self.keep_unparsed_tail then
      result.unparsed_tail = nil
    end

    return result
  end
