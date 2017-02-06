local cloned = {}

local clone
clone =
  function(node)
    if (type(node) == 'table') then
      if cloned[node] then
        return cloned[node]
      else
        local result = {}
        cloned[node] = result
        for k, v in pairs(node) do
          result[clone(k)] = clone(v)
        end
        setmetatable(result, getmetatable(node))
        return result
      end
    else
      return node
    end
  end

return
  function(node)
    cloned = {}
    return clone(node)
  end

--[[
* Metatables is shared, not cloned.

* This code optimized for performance.

  Main effect gave changing "is_table" to explicit type() check.
]]
