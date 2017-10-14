--[[
  Parse table with command line and return

    <f_in_name> <f_out_name>

  or fail and return nil.
]]

local usage_text =
[[
Get transformed annotated syntax tree (AST) for Lua 5.3 code.

lua.get_formatter_ast <f_in> [<f_out>]

-- Martin, 2017-10-14
]]

local cmdline_processor =
  new(request('!.mechs.command_line_processor.interface'))
cmdline_processor.allowed_params =
  {
    {name = 'f_in_name', type = 'string'},
    {name = 'f_out_name', type = 'string'},
  }

return
  function(args)
    assert_table(args)
    if not args[1] or (args[1] == '--help') then
      print(usage_text)
      return
    end

    local params = cmdline_processor:run(args)
    if not params.f_in_name then
      print(usage_text)
      return
    end

    local f_in_name, f_out_name
    f_in_name = params.f_in_name
    f_out_name = params.f_out_name or (f_in_name .. '.fast')

    return f_in_name, f_out_name
  end
