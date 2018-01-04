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
    {name = 'right-margin', type = 'key_int'},
    {name = 'max-text-width', type = 'key_int'},
    {name = 'keep-comments', type = 'flag'},
    {name = 'indent', type = 'key_str'},
  }

--[[
  Although original default parameters are stored in
  [lua.save.formatter.interface] I override it here.
]]
local default_formatter_options =
  {
    right_margin = 120,
    max_text_width = 100,
    indent_chunk = '  ',
    keep_comments = true,
  }

local table_to_str = request('!.formats.lua_table.save')

return
  function(args)
    assert_table(args)
    if not args[1] or (args[1] == '--help') then
      print(usage_text)
      print('Default options:')
      print(table_to_str(default_formatter_options))
      return
    end

    local params = cmdline_processor:run(args)

    local f_in_name, f_out_name
    f_in_name = params.f_in_name
    if not f_in_name then
      print(usage_text)
      return
    end
    f_out_name = params.f_out_name or (f_in_name .. '.formatted')

    params['max-text-width'] = params['max-text-width'] or params['right-margin']
    params['right-margin'] = params['right-margin'] or params['max-text-width']

    local formatter_options =
      new(
        default_formatter_options,
        {
          indent_chunk = params.indent,
          right_margin = params['right-margin'],
          max_text_width = params['max-text-width'],
          keep_comments = params['keep-comments'],
        }
      )

    return f_in_name, f_out_name, formatter_options
  end
