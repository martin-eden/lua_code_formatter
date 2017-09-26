--[[
  Process sequence with command-line arguments.
]]

return
  function(self, args)
    local options = self:parse_args(args)
    --[[
      <options> is map of records {type: <>, value: <>}.
      <result> should be map of values.
    ]]
    local result = {}
    for key, rec in pairs(options) do
      result[key] = rec.value
    end
    return result
  end
