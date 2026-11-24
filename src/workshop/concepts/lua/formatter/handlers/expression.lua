-- Serialize expression

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
]]

--[[
  Node structure

    1+ [t] -- term
      1 [t] -- unary operators list, may be empty
      2 [t] -- operand
      3 [?s] -- binary operator
]]

local represent_operand_oneline =
  function(me, node)
    local printer = me[1]
    local cur_un_op, prev_un_op
    for _, cur_un_op in ipairs(node[1]) do
      if (prev_un_op == '-') and (cur_un_op == '-') then
        -- Avoiding "-" "-" clash to comment "--"
        printer:add_to_curline(' -')
      elseif (cur_un_op == 'not') then
        printer:add_to_curline('not ')
      else
        printer:add_to_curline(cur_un_op)
      end
      prev_un_op = cur_un_op
    end
    if not me:process_node(node[2]) then
      return
    end
    if node[3] then
      printer:add_to_curline(' ' .. node[3] .. ' ')
    end
    return true
  end

local oneliner =
  function(me, node)
    for _, Term in ipairs(node) do
      if not represent_operand_oneline(me, Term) then
        return
      end
    end
    return true
  end

local represent_operand_multiline
do
  local line_wrap_op
  do
    local map_values = request('!.table.map_values')
    line_wrap_op =
      map_values({ 'and', 'or', '+', '-', '*', '/', '//', '..' })
  end
  represent_operand_multiline =
    function(me, node)
      if not represent_operand_oneline(me, node) then
        return
      end
      if line_wrap_op[node[3]] then
        me[1]:request_clean_line()
      end
      return true
    end
end

local multiliner =
  function(me, node)
    me[1]:request_clean_line()
    for _, term in ipairs(node) do
      if not represent_operand_multiline(me, term) then
        return
      end
    end
    return true
  end

return
  function(me, node)
    return me:variate(node, oneliner, multiliner)
  end

--[[
  2016 #
  2017 #
  2026-10-23
]]
