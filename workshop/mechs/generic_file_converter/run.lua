return
  function(self)
    local data_str = self:load()
    if data_str then
      local parse_result = self:parse(data_str)
      if parse_result then
        local compile_result = self:compile(parse_result)
        if compile_result then
          self:save(compile_result)
        end
      end
    end
    self:finish()
  end
