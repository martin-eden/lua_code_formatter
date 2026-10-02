-- Grammar for name

--[[
  Author: Martin Eden
  Last mod.: 2026-10-22
]]

--[[
  "Name" is alphanumeric (plus underscore) sequence of characters
  which is not reserved keyword.

  This matching implemented as function because it is a hot code and
  you can't use Lua regexps to exclude list of words.

  You can implement same idea as grammar

    { is_not(cho(<keyword>, ...)), match_regexp(<name_pattern>) }

  but this is less effective in practical sense.
]]

local opt_spc = request('opt_spc')

local is_name
do
  local name_pattern = '^[_A-Za-z][_A-Za-z0-9]*'

  local Keywords_Map
  do
    local Keywords = request('!.concepts.lua.Keywords')
    local map_values = request('!.table.map_values')
    Keywords_Map = map_values(Keywords)
  end

  is_name =
    function(StreamIn, StreamOut)
      local init_pos = StreamIn:get_position()

      if StreamIn:match_regexp(name_pattern) then
        local capture =
          StreamIn:get_segment(
            init_pos,
            StreamIn:get_position() - init_pos
          )

        if not Keywords_Map[capture] then
          return true
        else
          StreamIn:set_position(init_pos)
          return false
        end
      end
    end
end

-- Export:
return { opt_spc, { name = 'name', is_name } }

--[[
  2017 #
  2018 #
  2026-06-18
]]
