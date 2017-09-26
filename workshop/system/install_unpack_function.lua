--[[
  Make sure we have table.unpack().

                5.1  5.2  5.3
        unpack   +    +    -
  table.unpack   -    +    +
]]

do
  _G.table.unpack =
    _G.table.unpack or
    _G.unpack or
    function(...)
      return {n = select('#', ...), ...}
    end
end
