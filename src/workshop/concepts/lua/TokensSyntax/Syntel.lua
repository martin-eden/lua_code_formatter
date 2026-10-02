-- Syntax element grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-28
]]

--[[
  Syntax elements are that punctuation chars (and tuples) and keywords
]]

local name_pattern = '^[_A-Za-z][_A-Za-z0-9]*'

local Keywords_Map
do
  local Keywords = request('!.concepts.lua.Keywords')
  local map_values = request('!.table.map_values')
  Keywords_Map = map_values(Keywords)
end

local is_keyword =
  function(Input)
    local init_pos = Input:get_position()

    if Input:match_regexp(name_pattern) then
      local capture =
        Input:get_segment(
          init_pos,
          Input:get_position() - init_pos
        )

      if Keywords_Map[capture] then
        return true
      else
        Input:set_position(init_pos)
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
