-- "global <const> *" serialization

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
  "global <a> *" is parsed to

    {
      type = 'global_statement',
      {
        type = 'global_all',
        {
          type = 'attribute',
          {
            type = 'name',
            'a'
          },
        },
      },
    }

  "global *" is parsed to

    {
      type = 'global_statement',
      {
        type = 'global_all',
        value = '*',
      },
    }
]]

return
  function(Me, Node)
    local Printer = Me[2]
    if not Node[1] then
      Printer:AddToCurline('*')
      return true
    end
    if not Me:ProcessNode(Node[1]) then return end
    Printer:AddToCurline(' *')
    return true
  end

--[[
  2026-10-28
]]
