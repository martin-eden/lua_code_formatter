return
  function(self, node)
    local result
    if node[1] then
      result = self:process_node(node[1])
      if (node[1].name == 'expr_list') then
        -- It's ok. No need to modify <result> now.
      else
        -- Arg is directly mentioned table or string (require 'abc')
        result = {result}
      end
    else
      -- Empty args ()
      result = {}
    end
    result.type = 'func_args'
    return result
  end
