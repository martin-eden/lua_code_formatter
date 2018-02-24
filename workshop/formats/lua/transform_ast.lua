--[[
  This is AST transformer.

  It reformulates structure produced by parser to something simpler
  to manage.

  For example numeric "for" loop represented as sequence

    "for", <name>, "=", <expr>, ",", <expr>, [",", <expr>], "do", ...

  It transformed to specific record:

    <numeric_for_block>:
      index = <name>,
      start_val = <expr>,
      end_val = <expr>,
      increment = <expr>,
      ...
]]

local c_transformer = request('ast_transformer.interface')

return
  function(data_struc, options)
    local transformer = new(c_transformer, options)
    transformer.data_struc = data_struc
    return transformer:run()
  end
