-- AST formatter

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

return
  {
    right_margin = 80,
    indent_chunk = '  ',

    data_struc = nil,
    is_ok = true,

    init = request('init'),
    run = request('run'),
    get_result = request('get_result'),

    printer = { },
    state_keeper = request('state_keeper.interface'),

    handlers = request('handlers.interface'),

    process_list = request('process_list'),
    process_node = request('process_node'),

    process_block_oneline = request('process_block_oneline'),
    process_block_multiline = request('process_block_multiline'),
    process_block = request('process_block'),

    represent = request('represent'),
    variate = request('variate'),
    process_list_variative = request('process_list_variative'),

    representation_is_allowed = request('representation_is_allowed'),
  }

--[[
  2016 #
  2017 # # #
  2018 #
  2026-10-21
  2026-10-23
]]
