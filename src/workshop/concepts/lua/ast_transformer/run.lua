-- Transform syntax tree for forecoming formatting routines

--[[
  Author: Martin Eden
  Last mod.: 2026-10-25
]]

return
  function(Me, SyntaxTree)
    local Result = SyntaxTree

    for subnode_index in ipairs(Result) do
      Me:align_nodes(Result, subnode_index)
    end
    Me:restruc_nodes(Result)

    return Result
  end

--[[
  2018 # #
  2026 # #
  2026-10-25
]]
