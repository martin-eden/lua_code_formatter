-- Transform AST for forecoming formatting routines

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

return
  function(Me)
    assert_table(Me.data_struc)

    local Result = Me.data_struc

    for subnode_index in ipairs(Result) do
      Me:align_nodes(Result, subnode_index)
    end
    Me:restruc_nodes(Result)

    return Result
  end

--[[
  2018 # #
  2026-10-21
  2026-10-23
]]
