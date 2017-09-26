return
  {
    f_in_name = '',
    f_out_name = '',
    description = 'Generic file converter.',
    usage = 'Usage: <f_in> <f_out>',

    init = request('init'),
    run = request('run'),

    load = request('!.file.text_file_as_string'),
    parse = request('!.formats.lua_table_code.load'),
    compile = request('compile'),
    save = request('!.string.save_to_file'),

    say = request('say'),
    get_state_str = request('get_state_str'),
    error = request('error'),
    print_usage = request('print_usage'),
  }
