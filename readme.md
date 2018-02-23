# Description

Formats any valid Lua 5.3 code.

Lines with code are wrapped to fit inside given margins.

Files with invalid Lua syntax may lose the content after the syntax
error! lcf's parser is more permissible than Lua's, so make sure to
verify the correctness of the file before running lcf.
For example via `$ luac -p <filename>`.

Installation script deploys three command-line scripts:

  * lua.reformat
  * lua.get_ast
  * lua.get_formatter_ast

Last two for people who love tinkering.


# Requirements

Sole requirement is Lua v5.3. Earlier versions will not work.

It may or may not work under Windows. I've not tested it there.

For Lua v5.1 checkout `5.1` branch.


# Installation

    $ sudo luarocks make lcf-scm-1.rockspec

(also works `$ sudo luarocks install lcf`)


# Usage

## From command-line

    $ lua.reformat <f_in>

You can pass formatter parameters in command line. For available
options call `$ lua.reformat`.


## From Lua interpreter

Suppose you have a string with Lua code and wish to get another string
with formatted code.

    do
      local lua_code_str = 'do return end' -- < fill it

      require('lcf.workshop.base')
      local get_ast = request('!.lua.code.get_ast')
      local get_formatted_code = request('!.formats.lua.save')

      return get_formatted_code(get_ast(lua_code_str))
    end


### Passing formatting parameters

You may override default parameters by passing a table with new values
of changed parameters:

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

* `indent_chunk` is a string using for building one indent. You may try
  value `|..` to see it's effect.

* `right_margin` limits length of line with indent. Setting it makes
  sense for printing.

* `max_text_width` limits length of line without indent, i.e. length of
  text in line. Setting it makes sense for windowed viewing in editor.

* `keep_unparsed_tail` is a flag to keep text after point where we
  failed to parse source.

  Syntactically incorrect code may lose significant parts even with
  this flag. For example `f() = a` is formatted as `f()`. (Because
  it's parsed as assignment but formatted as function call.) But text
  like `1; f() = a` will fail to parse and will remain intact.

* `keep_comments` is a flag to keep comments. Comment text is not changed
so comments may last beyond right margin.

  Comments are "sinked-up" to statements level. So text

      function(a, --parameter "a"
        b) --parameter "b"
      end

  is formatted as

      --parameter "a"
      function(a, b)
        --parameter "b"
      end

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

* It uses local copy of my ["workshop"](https://github.com/martin-eden/workshop) code hive.

* See also [my repositories contents](https://github.com/martin-eden/contents).

---
```
2016-08-16
2017-01-28
2017-09-26
2018-02-23
```
