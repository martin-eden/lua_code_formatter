-- String literal grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-20
]]

--[[
  String literal definition.

  <string>:

    - <opt_spc> -+- <long_bracket> -----------------+-
                 +- """ -+------------------+- """ -+
                 |       +- "\" - any_char -+       |
                 |       +- any_char -------+       |
                 +- "'" -+------------------+- "'" -+
                         +- "\" - any_char -+
                         +- any_char -------+
]]

local handy = request('!.mechs.processor.handy')
local opt_rep = handy.opt_rep
local cho = handy.cho
local match_regexp = request('!.mechs.parser.handy').match_regexp
local opt_spc = request('words.opt_spc')
local long_bracket = request('words.particles.long_bracket')

return
  {
    opt_spc,
    {
      name = 'string',
      cho(
        long_bracket,
        {
          '"',
          opt_rep(
            cho(
              match_regexp([[[^%\%"]+]]),
              match_regexp([[%\.]])
            )
          ),
          '"'
        },
        {
          "'",
          opt_rep(
            cho(
              match_regexp([[[^%\%']+]]),
              match_regexp([[%\.]])
            )
          ),
          "'"
        }
      ),
    }
  }

--[[
  2016 #
  2017 #
  2018 #
  2026-10-20
]]
