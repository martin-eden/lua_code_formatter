return
  {
    expression = request('expression'),

    function_call = request('expressions.function_call'),
    name = request('expressions.name'),
    var_link = request('expressions.var_link'),
    vararg = request('expressions.vararg'),

    boolean = request('expressions.data_types.boolean'),
    ['nil'] = request('expressions.data_types.nil'),
    number = request('expressions.data_types.number'),
    string = request('expressions.data_types.string'),
    table = request('expressions.data_types.table'),
    type_function = request('expressions.data_types.type_function'),

    statements = request('statements'),

    assignment = request('statements.assignment'),
    break_statement = request('statements.break_statement'),
    comment = request('statements.comment'),
    goto_statement = request('statements.goto_statement'),
    label_statement = request('statements.label_statement'),
    local_assignment = request('statements.local_assignment'),
    return_statement = request('statements.return_statement'),

    do_block = request('statements.blocks.do_block'),
    generic_for_block = request('statements.blocks.generic_for_block'),
    if_block =request('statements.blocks.if_block'),
    local_named_function = request('statements.blocks.local_named_function'),
    named_function = request('statements.blocks.named_function'),
    numeric_for_block = request('statements.blocks.numeric_for_block'),
    repeat_block = request('statements.blocks.repeat_block'),
    while_block = request('statements.blocks.while_block'),

    bracket_expr = request('wrappers.bracket_expr'),
    colon_name = request('wrappers.colon_name'),
    dot_name = request('wrappers.dot_name'),
    dot_list = request('wrappers.dot_list'),
    expr_list = request('wrappers.expr_list'),
    func_args = request('wrappers.func_args'),
    function_params = request('wrappers.function_params'),
    name_list = request('wrappers.name_list'),
    name_parts = request('wrappers.name_parts'),
    par_expr = request('wrappers.par_expr'),
    ref_list = request('wrappers.ref_list'),
  }
