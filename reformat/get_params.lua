--[[
  Parse given command line and return three values:

    <f_in_name> <f_out_name> <formatter_options>

  Alternatively may print usage help and return nothing.
]]

local usage_text = request('usage_text')

local cmdline_processor =
  new(request('!.mechs.command_line_processor.interface'))
cmdline_processor.allowed_params =
  {
    {name = 'f_in_name', type = 'string'},
    {name = 'f_out_name', type = 'string'},
    {name = 'indent', type = 'key_str'},
    {name = 'right-margin', type = 'key_int'},
    {name = 'max-text-width', type = 'key_int'},
    {name = 'keep-comments', type = 'flag'},
    {name = 'keep-unparsed-tail', type = 'flag'},
  }

--[[
  Although original default parameters are stored in
  [lua.formatter.interface] I override it here.
]]
local default_formatter_options =
  {
    indent_chunk = '  ',
    right_margin = 96,
    max_text_width = math.huge,
    keep_comments = true,
    keep_unparsed_tail = true,
  }

local table_to_str = request('!.formats.lua_table.save')

return
  function(args)
    assert_table(args)
    if not args[1] or (args[1] == '--help') then
      print(usage_text)
      print('Defaults:')
      print(table_to_str(default_formatter_options))
      print('\n-- Martin, 2018-02')
      return
    end

    local params = cmdline_processor:run(args)

    local f_in_name = params.f_in_name
    if not f_in_name then
      print(usage_text)
      return
    end

    local f_out_name = params.f_out_name
    if not f_out_name then
      f_out_name = f_in_name .. '.formatted'
    end

    local formatter_options =
      new(
        default_formatter_options,
        {
          indent_chunk = params.indent,
          right_margin = params['right-margin'],
          max_text_width = params['max-text-width'],
          keep_comments = params['keep-comments'],
          keep_unparsed_tail = params['keep-unparsed-tail'],
        }
      )

    return f_in_name, f_out_name, formatter_options
  end
