-- Clone table (deep copy). Metatables are shared, not cloned

--[[
  Author: Martin Eden
  Last mod.: 2026-11-10
]]

return
  function(node)
    local clone
    do
      local cloned = { }

      clone =
        function(node)
          if (type(node) ~= 'table') then
            return node
          end

          if cloned[node] then
            return cloned[node]
          end

          local result = { }

          cloned[node] = result

          for key, value in pairs(node) do
            result[clone(key)] = clone(value)
          end

          setmetatable(result, getmetatable(node))

          return result
        end
    end

    return clone(node)
  end

--[[
  2016 # #
  2017 #
]]
