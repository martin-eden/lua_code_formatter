Formats any valid lua 5.3 code.

Main advantage is that it wraps code lines at right margin (default
is 70th character in line). Efforts are made to represent code in more
easy to understand form, not the shortest one.

Requirements
  Sole requirement is lua5.3. Earlier versions will not work.

Usage
  `lua5.3 lua.reformat.lua <fIn> <fOut>`

Try
  `lua lua.reformat.lua lua.reformat.lua lua.reformat.lua.formatted`
---
* Built on my own general strings parser,
  which uses my own lua syntax representation,
  produces AST (annotated syntax tree),
  which is further structured for code formatter,
  which gets this structured AST and produce code layout,
  trying all possible variants to fit code in 70-symbol lines
  and maintain indentation.

* Currently comments are stripped from code. I'll add support
  for them someday.

* Also debugging/historical modules supplied:
    `lua.get_formatter_tree.lua`
    `lua.get_parse_tree.lua`
    `lua.split_comments.lua`

* It uses local copy of my "workshop" code hive.
  Current version: https://github.com/martin-eden/workshop

* See also [https://github.com/martin-eden/contents]()
---
2016-08-16
2017-01-03
2017-01-18
2017-01-22
