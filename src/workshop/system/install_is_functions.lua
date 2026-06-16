--[[
  Create "is_<type>" family of global functions.
]]

local data_types = request('!.lua.data_types')

for _, type_name in ipairs(data_types) do
  _G['is_' .. type_name] =
    function(a)
      return (type(a) == type_name)
    end
end

_G.is_integer =
  function(n)
    return (math.type(n) == 'integer')
  end
