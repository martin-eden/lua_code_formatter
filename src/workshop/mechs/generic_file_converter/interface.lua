return
  {
    -- core
    f_in_name = '',
    f_out_name = '',
    init = request('init'),
    run = request('run'),
    -- adjustable
    load = request('!.file.text_file_as_string'),
    parse = request('!.formats.lua_table_code.load'),
    compile = request('compile'),
    save = request('!.string.save_to_file'),
    -- implementation
    say = request('say'),
  }
