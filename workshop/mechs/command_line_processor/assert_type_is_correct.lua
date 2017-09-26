return
  function(self, name, item_type)
    for _, param_rec in ipairs(self.allowed_params) do
      if (param_rec.name == name) then
        if (param_rec.type ~= item_type) then
          local msg =
            ('Actual type for parameter "%s" is "%s", not "%s".'):
            format(name, param_rec.type, item_type)
          error(msg)
        end
        return true
      end
    end
    error(('No record for parameter "%s".'):format(name))
  end
