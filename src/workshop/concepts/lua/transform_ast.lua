-- AST transformer

--[[
  Author: Martin Eden
  Last mod.: 2026-10-25
]]

--[[
  It reformulates structure produced by parser to something simpler
  to manage.

  For example numeric "for" loop is represented as sequence

    "for", <name>, "=", <expr>, ",", <expr>, [",", <expr>], "do", ...

  It's transformed to custom record:

    <numeric_for_block>:
      index = <name>,
      start_val = <expr>,
      end_val = <expr>,
      increment = <expr>,
      ...
]]

local align_nodes = request('ast_transformer.align_nodes')
local restruc_nodes = request('ast_transformer.restruc_nodes')
local Handlers = request('ast_transformer.Handlers.Interface')

return
  function(SyntaxTree)
    for subnode_index in ipairs(SyntaxTree) do
      align_nodes(SyntaxTree, subnode_index)
    end
    restruc_nodes(SyntaxTree, Handlers)

    return SyntaxTree
  end

--[[
  2018 #
  2026-10-23
]]
