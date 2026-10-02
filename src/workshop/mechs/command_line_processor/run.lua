--[[
  Process sequence with command-line arguments. Return map of
  parameter values.

  Input is list of records

    type: +- 'key_int' -+- name: <string> -
          +- 'key_str' -+
          +- 'flag' ----+
          +- 'string' --+
]]

return
  function(self, params)
    assert_table(params)
    local options = self:parse_params(params)
    local result = {}
    for key, rec in pairs(options) do
      result[key] = rec.value
    end
    return result
  end
