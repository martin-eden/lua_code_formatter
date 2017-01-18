Currently I'm working on solving performance problems.
In this version smart formatting (it is for what I'm developing
this tool) is disabled as now it easily becomes too slow.
To enamble it uncomment block starting from
"if self.representation_is_allowed(init_last_line) then"
in "variate.lua".

2017-01-18
--
Formats any valid lua 5.3 code.

Sole requirement is lua5.3.

Try

  lua lua.reformat.lua lua.reformat.lua lua.reformat.lua.formatted

It uses local copy of my "workshop" code hive.

See also https://github.com/martin-eden/contents

2016-08-16
2017-01-03
2017-01-18
