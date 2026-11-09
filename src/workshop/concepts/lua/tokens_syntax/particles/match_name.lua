-- Name pattern matcher

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

--[[
  It's used in two places:

    * When capturing name. We don't want keywords there
    * When capturing syntel. We do want keywords there
]]

local name_pattern = '^[_A-Za-z][_A-Za-z0-9]*'
local match_regexp = request('!.mechs.parser.handy').match_regexp

return match_regexp(name_pattern)

--[[
  2026-11-12
]]
