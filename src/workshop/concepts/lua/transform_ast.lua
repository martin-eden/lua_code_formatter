-- AST transformer

--[[
  Author: Martin Eden
  Last mod.: 2026-11-11
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
local handlers = request('ast_transformer.handlers.interface')

return
  function(syntax_tree)
    for subnode_index in ipairs(syntax_tree) do
      align_nodes(syntax_tree, subnode_index)
    end
    restruc_nodes(syntax_tree, handlers)

    return syntax_tree
  end

--[[
  2018 #
  2026-10-23
]]
