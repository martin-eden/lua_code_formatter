local match_regexp = request('!.mechs.parser.handy').match_regexp
local opt_spc = request('opt_spc')

local keywords = request('!.formats.lua.keywords')
local name_pattern = '^[_A-Za-z][_A-Za-z0-9]*'

local is_name =
  function(in_stream, out_stream)
    local init_pos = in_stream:get_position()
    if in_stream:match_regexp(name_pattern) then
      local s = in_stream:get_segment(init_pos, in_stream:get_position() - init_pos)
      if keywords[s] then
        in_stream:set_position(init_pos)
        return false
      else
        return true
      end
    end
  end

return
  {
    name = 'name',
    opt_spc, is_name,
  }
