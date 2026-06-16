return
  function(self, idx)
    local num_found = 0
    for _, param_rec in ipairs(self.allowed_params) do
      if (param_rec.type == 'string') then
        num_found = num_found + 1
        if (num_found == idx) then
          return param_rec.name
        end
      end
    end
    local msg =
      ('Description for string parameter #%d not provided.'):format(idx)
    error(msg)
  end
