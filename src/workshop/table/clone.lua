-- Clone table (deep copy). Metatables are shared, not cloned

--[[
  Author: Martin Eden
  Last mod.: 2026-08-28
]]

-- Export:
return
  function(Node)
    local clone
    do
      local Cloned = { }

      clone =
        function(Node)
          if (type(Node) ~= 'table') then
            return Node
          end

          if Cloned[Node] then
            return Cloned[Node]
          end

          local Result = { }

          Cloned[Node] = Result

          for key, value in pairs(Node) do
            Result[clone(key)] = clone(value)
          end

          setmetatable(Result, getmetatable(Node))

          return Result
        end
    end

    return clone(Node)
  end

--[[
  2016 # #
  2017 #
]]
