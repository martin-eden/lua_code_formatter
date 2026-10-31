-- Formatting functions

--[[
  Author: Martin Eden
  Last mod.: 2026-10-28
]]

-- Interface is a map of node type to function

return
  {
    ['expression'] = request('expression'),

    ['function_call'] = request('expressions.function_call'),
    ['var_ref'] = request('expressions.var_ref'),

    ['string'] = request('expressions.string'),
    ['table'] = request('expressions.table'),
    ['type_function'] = request('expressions.type_function'),

    ['statements'] = request('statements'),

    ['assignment'] = request('statements.assignment'),
    ['break_statement'] = request('statements.break_statement'),
    ['global_statement'] = request('statements.global_statement'),
    ['goto_statement'] = request('statements.goto_statement'),
    ['label_statement'] = request('statements.label_statement'),
    ['local_assignment'] = request('statements.local_assignment'),
    ['return_statement'] = request('statements.return_statement'),

    ['do_block'] = request('statements.blocks.do_block'),
    ['generic_for_block'] = request('statements.blocks.generic_for_block'),
    ['if_block'] =request('statements.blocks.if_block'),
    ['local_named_function'] = request('statements.blocks.local_named_function'),
    ['named_function'] = request('statements.blocks.named_function'),
    ['numeric_for_block'] = request('statements.blocks.numeric_for_block'),
    ['repeat_block'] = request('statements.blocks.repeat_block'),
    ['while_block'] = request('statements.blocks.while_block'),

    ['attr_name'] = request('wrappers.attr_name'),
    ['attr_name_list'] = request('wrappers.attr_name_list'),
    ['attribute'] = request('wrappers.attribute'),
    ['bracket_expr'] = request('wrappers.bracket_expr'),
    ['colon_name'] = request('wrappers.colon_name'),
    ['dot_name'] = request('wrappers.dot_name'),
    ['dot_list'] = request('wrappers.dot_list'),
    ['expr_list'] = request('wrappers.expr_list'),
    ['func_args'] = request('wrappers.func_args'),
    ['function_params'] = request('wrappers.function_params'),
    ['global_all'] = request('wrappers.global_all'),
    ['name_list'] = request('wrappers.name_list'),
    ['name_parts'] = request('wrappers.name_parts'),
    ['named_vararg'] = request('wrappers.named_vararg'),
    ['par_expr'] = request('wrappers.par_expr'),
    ['ref_list'] = request('wrappers.ref_list'),
  }

--[[
  2017 #
  2018 # #
  2026 #
  2026-10-28
]]
