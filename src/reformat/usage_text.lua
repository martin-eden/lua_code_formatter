return
[[
Reformat Lua 5.3 code.

lua.reformat   <f_in>   [<f_out>]
             ┬        ┬           ┬
             │        │           │
             └── [<options>] ─────┘

<options>:

  --indent=<str>          Use given string as indent chunk.

  --right-margin=<int>    Right margin, including indent part.
  --max-text-width=<int>  Maximum text length, excluding indent part.

  --keep-comments         Keep comments.
  --~keep-comments        Remove comments.

  --keep-unparsed-tail    Keep unparsed file end.
  --~keep-unparsed-tail   Remove unparsed file end.

<f_out>:

  If not given, file name is generated using <f_in> prefix.
]]
