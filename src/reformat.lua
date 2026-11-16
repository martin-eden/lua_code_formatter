-- Reformat Lua code

--[[
  Author: Martin Eden
  Last mod.: 2026-11-16
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

-- Martin, 2026-11
]]

local input_file_name
local output_file_name
local indent_chunk
local right_margin
do
  local parse_command_line = request('!.mechs.parse_command_line')
  local default_indent_chunk = '  '
  local default_right_margin = 72
  local args = parse_command_line(_G.arg)
  input_file_name = args[1]
  output_file_name = args[2]
  indent_chunk = args['indent'] or default_indent_chunk
  right_margin = tonumber(args['right-margin']) or default_right_margin
  if
    not (
      input_file_name and
      output_file_name and
      indent_chunk and
      right_margin
    )
  then
    print(usage_text)
    return
  end
end

local file_to_str = request('!.convert.file_to_str')
local str_format = string.format
local reformat = request('!.lua.reformat_code')
local file_from_str = request('!.convert.file_from_str')

print('( Lua code reformatter')
local input_code_str = file_to_str(input_file_name)
print(str_format('  Read code from "%s".', input_file_name))

local options =
  { indent_chunk = indent_chunk, right_margin = right_margin }
file_from_str(output_file_name, reformat(input_code_str, options))

print(str_format('  Wrote code to "%s".', output_file_name))
print(')')

--[[
  2017 # #
  2018 #
  2026 # # #
  2026-10-31
]]
