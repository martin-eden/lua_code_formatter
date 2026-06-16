local match_regexp = request('!.mechs.parser.handy').match_regexp

--[[
  In human words: idea is to capture "="'s that may be present between
  "[[" in opening quote. And then use this capture in closing quote.

    "%[(%=*)%[" means "[" <store possible "="'s as capture> "["
    ".-" - eat any chars while not next pattern occurred
    "%]%1%]" means "]" <capture #1> "]"
]]
return match_regexp('%[(%=*)%[.-%]%1%]')
