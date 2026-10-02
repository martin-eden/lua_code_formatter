--[[
  Parse command-line parameters placed in <.params>.
  Match their types with parameters from <.allowed_params>.
  Raise error on mismatch.
  Return key-value table.
]]

return
  function(self, params)
    local result = {}
    local num_strings = 0

    for _, item in ipairs(params) do
      local item_type, key, value = self:classify_item(item)
      if (item_type == 'string') then
        num_strings = num_strings + 1
        key = self:get_key_name(num_strings)
      end
      self:assert_type_is_correct(key, item_type)
      result[key] =
        {
          type = item_type,
          value = value,
        }
    end

    return result
  end
