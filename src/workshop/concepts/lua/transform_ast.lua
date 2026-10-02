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

local Transformer = request('ast_transformer.interface')

return
  function(SyntaxTree)
    return Transformer:run(SyntaxTree)
  end

--[[
  2018 #
  2026-10-23
]]
