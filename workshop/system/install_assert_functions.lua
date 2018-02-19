--[[
  Create "assert_<type>" family of global functions.
]]

local data_types = request('!.lua.data_types')

for _, type_name in ipairs(data_types) do
  _G['assert_' .. type_name] =
    function(a, responsibility_level)
      local responsibility_level = (responsibility_level or 1)
      if (type(a) ~= type_name) then
        error(
          ('Argument must have a type "%s", not "%s".'):
          format(type_name, type(a)),
          responsibility_level + 1
        )
      end
    end
end

_G.assert_integer =
  function(a, responsibility_level)
    local responsibility_level = (responsibility_level or 1)
    if (math.type(a) ~= 'integer') then
      error(
        ('Argument must be integer, not %s.'):format(type(a)),
        responsibility_level + 1
      )
    end
  end
