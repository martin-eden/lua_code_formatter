return
  function(self, node)
    local result
    if node[1] then
      result = self:process_node(node[1])
      if (node[1].name == 'expr_list') then
        -- It's ok. No need to modify <result> now. (f(a, b))
      else
        -- Arg is a directly mentioned table or string (f 'abc')
        result = {result}
      end
    else
      -- Empty args (f())
      result = {}
    end
    result.type = 'func_args'
    return result
  end
