-- Name grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-26
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

local name_pattern = '^[_A-Za-z][_A-Za-z0-9]*'

local Keywords_Map
do
  local Keywords = request('!.concepts.lua.Keywords')
  local map_values = request('!.table.map_values')
  Keywords_Map = map_values(Keywords)
end

return
  function(Input)
    local init_pos = Input:get_position()

    if Input:match_regexp(name_pattern) then
      local capture =
        Input:get_segment(
          init_pos,
          Input:get_position() - init_pos
        )

      if not Keywords_Map[capture] then
        return true
      else
        Input:set_position(init_pos)
        return false
      end
    end
  end

--[[
  2017 #
  2018 #
  2026 #
  2026-10-26
]]
