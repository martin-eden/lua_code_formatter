return
[[
Reformat Lua 5.3 code.

lua.reformat   <f_in>   [<f_out>]
             ┬        ┬           ┬
             │        │           │
             └── [<options>] ─────┘

<options>:
  --right-margin=<int> -- Right margin, indent chars counts.
  --max-text-width=<int> -- Maximum text length, ignoring indent chars.
  --keep-comments -- Keep comments.
  --~keep-comments -- Remove comments.
  --indent=<str> -- Use given string as indent chunk.

Notes
  * In case when only one parameter of (right-margin, max-text-width)
    is given, another parameter is set to same value. This is done
    because these parameters have similar effect and in other case
    you wish to set another parameter to near value manually.

  * If <f_out> name is not given, it's generated using <f_in> name.

-- Martin, 2017-10-14
]]
