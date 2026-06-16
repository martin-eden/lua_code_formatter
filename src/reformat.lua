-- Reformat Lua code

--[[
  Author: Martin Eden
  Last mod.: 2026-10-28
]]

require('workshop.base')

local usage_text =
[[
Reformat Lua 5.5 code.

Usage:   f_in   f_out
       ┬      ┬       ┬
       │      │       │
       └── [options] ─┘

<options>:

  --indent=<str>        Use given string as indent chunk.
  --right-margin=<int>  Right margin.

-- Martin, 2026-10
]]

local get_params
do
  --[[
    Parse command line and return table:

      input_file_name [?s] -- input file name
      output_file_name [?s] -- output file name
      indent_chunk [?s] -- indent chunk
      right_margin [?i] -- right margin
  ]]

  local CommandlineProcessorClass =
    request('!.mechs.command_line_processor.interface')

  get_params =
    function()
      CommandlineProcessor = new(CommandlineProcessorClass)
      CommandlineProcessor.allowed_params =
        {
          { name = 'input_file_name', type = 'string' },
          { name = 'output_file_name', type = 'string' },
          { name = 'indent', type = 'key_str' },
          { name = 'right-margin', type = 'key_int' },
        }

      local Params = CommandlineProcessor:run(_G.arg)

      return
        {
          input_file_name = Params.input_file_name,
          output_file_name = Params.output_file_name,
          right_margin = Params['right-margin'],
          indent_chunk = Params.indent,
        }
    end
end

local file_to_str = request('!.convert.file_to_str')
local file_from_str = request('!.convert.file_from_str')
local str_format = string.format
local reformat = request('!.lua.code.reformat')

local DefaultOptions =
  {
    indent_chunk = '  ',
    right_margin = 72,
  }

local Params = get_params()
local input_file_name = Params.input_file_name
local output_file_name = Params.output_file_name
local indent_chunk = Params.indent_chunk or DefaultOptions.indent_chunk
local right_margin = Params.right_margin or DefaultOptions.right_margin

if not (input_file_name and output_file_name) then
  print(usage_text)
  return
end

print('( Lua code reformatter')
local input_code_str = file_to_str(input_file_name)
print(str_format('  Read code from "%s".', input_file_name))

file_from_str(output_file_name, reformat(input_code_str, Options))
print(str_format('  Formatted code to "%s".', output_file_name))
print(')')

--[[
  2017 # #
  2018 #
  2026 # #
  2026-10-24
]]
