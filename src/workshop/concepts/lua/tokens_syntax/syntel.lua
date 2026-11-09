-- Syntax element grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

--[[
  Syntax elements are that punctuation chars (and tuples) and keywords
]]

local match_name = request('particles.match_name')
local keywords_map = request('!.concepts.lua.keywords_map')

local is_keyword =
  function(input)
    local init_pos = input:get_position()
    if match_name(input) then
      local token =
        input:get_segment(
          init_pos,
          input:get_position() - init_pos
        )
      if keywords_map[token] then
        return true
      else
        input:set_position(init_pos)
        return false
      end
    end
  end

local match_regexp = request('!.mechs.parser.handy').match_regexp
local cho = request('!.mechs.processor.handy').cho

return
  {
    cho(
      is_keyword,
      '==',
      '~=',
      '<=',
      '<<',
      '>=',
      '>>',
      '...',
      '..',
      '//',
      '::',
      match_regexp('[%=%~%<%>%.%:%,%;%/%(%)%[%]%{%}%-%+%#%*%%%^%&%|]')
    )
  }

--[[
  2026-10-26
  2026-10-28
]]
