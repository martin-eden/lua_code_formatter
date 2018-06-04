# Description

Formats any valid Lua 5.3 code.

Lines with code are wrapped to fit inside given margins.

Files with invalid Lua syntax may lose the content after the syntax
error! If this is a problem - verify the correctness of the file before
running reformatter. For example via `$ luac -p <lua_file>`.

Installation script deploys three command-line scripts:

  * `lua.reformat`
  * `lua.get_ast`
  * `lua.get_formatter_ast`

Last two for people who love tinkering.


# Requirements

* [LuaRocks](https://luarocks.org/). For easy installation.
* [Lua interpreter](https://lua.org). Version 5.3 is preferred. Another options described
in a following table.

| Branch | Lua version required | Syntax supported | Notes |
| --- |:---:|:---:| --- |
| master | 5.3 | 5.3 | may contain experimental features |
| 5.3 | 5.3 | 5.3 | |
| 5.1 | 5.1 |  5.3 | for thouse bounded to 5.1 |
| 5.1-syntax_5.1 | 5.1 | 5.1 | `goto` is not a keyword here |

It may or may not work under Windows. I've not tested it there.


# Installation

* `$ git clone https://github.com/martin-eden/lua_code_formatter`
* `$ cd ./lua_code_formatter`
* `$ sudo luarocks make lcf-scm-1.rockspec`

Alternatively, you may just `$ sudo luarocks install lcf` to get
stable version.


# Deinstallation

* `$ sudo luarocks remove lcf`
* Delete `lua_code_formatter` directory.


# Usage

## From command-line

`$ lua.reformat <lua_file>`

For available options call it without arguments: `$ lua.reformat`.


## From Lua interpreter

Suppose you have a string with Lua code and wish to get another string
with formatted code.

```lua
do
  local lua_code_str = 'do return end' -- < fill it

  require('lcf.workshop.base')
  local get_ast = request('!.lua.code.get_ast')
  local get_formatted_code = request('!.lua.code.ast_as_code')

  return get_formatted_code(get_ast(lua_code_str))
end
```

### Passing formatting parameters

You may override default parameters by passing a table with new values
of changed parameters:

```lua
get_formatted_code(
  get_ast(lua_code_str),
  {
    indent_chunk = '  ',
    right_margin = 96,
    max_text_width = math.huge,
    keep_unparsed_tail = true,
    keep_comments = true,
  }
)
```

| Parameter | Default | Description | Notes |
| --- |:---:| --- | --- |
| `indent_chunk` | ` ` ` ` | String used for building one indent. | You may try value `\|..` to see it's effect. |
| `right_margin` | 96 | Maximum line length with indent. | Setting it makes sense for printing. |
| `max_text_width` | +inf | Maximum line length without indent. | Setting it makes sense for viewing in editor. |
| `keep_unparsed_tail` | true | Keep text after point where we failed to parse source. | Syntactically incorrect code may lose significant parts even with this flag. For example `f() = a` is formatted as `f()`. (Because it's parsed as assignment but formatted as function call.) But text like `1; f() = a` will fail to parse and will remain intact. |
| `keep_comments` | true | Keep comments. | Comment text is not changed so comments may last beyond right margin. |

Comments are "sinked-up" to statements level. So text
  ```lua
  function(a, --parameter "a"
    b) --parameter "b"
  end
  ```
is formatted as
  ```lua
  --parameter "a"
  function(a, b)
    --parameter "b"
  end
  ```
This is done to keep formatting routines simple.

---

* Based on my own generic stream processing core,
  which is extended to generic strings parser,
  which uses my own loseless Lua syntax representation,
  produces AST (annotated syntax tree),
  which is further simplified and structured for code formatter,
  which produces code layout,
  trying all possible variants to fit code under given margins
  and maintain indentation.

* See also [my other repositories](https://github.com/martin-eden/contents).

---
```
2016-08-16
2017-01-28
2017-09-26
2018-02-23
```
