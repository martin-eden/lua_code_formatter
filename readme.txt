Description

  Formats any valid Lua 5.3 code.

  Lines with code are wrapped to fit inside given margins.

  Installation script deploys three command-line scripts:

    lua.reformat
    lua.get_ast
    lua.get_formatter_ast

  Last two for that guys that love tinkering.


Requirements

  Sole requirement is Lua v5.3. Earlier versions will not work.
  (I've made a backport for Lua v5.1. See "5.1" branch. It is not
  affected by recent changes and probably will be dropped someday.)

  It may or may not work under Windows. I've not tested it there.


Installation

  > sudo luarocks make lcf-scm-1.rockspec

  (also works "sudo luarocks install lcf")


Usage

  From command-line

    > lua.reformat <f_in>

    You can pass formatter parameters in command line. For
    syntax call "lua.reformat" without parameters.


  From Lua interpreter

    Suppose you have a string with Lua code and wish to get another
    string with formatted code.

    do
      local lua_code_str = 'do return end' -- < fill it

      require('lcf.workshop.base')
      local get_ast = request('!.lua.code.get_ast')
      local get_formatted_code = request('!.formats.lua.save')

      return get_formatted_code(get_ast(lua_code_str))
    end


    Passing formatting parameters

      You may override default parameters by passing a table with
      new values of changed parameters:

      get_formatted_code(
        get_ast(lua_code_str),
        {
          indent_chunk = '  ',
          right_margin = 100,
          max_text_width = 65,
          keep_comments = true,
        }
      )

      <indent_chunk> is a string using for building one indent.
        You may try '|..' to see it's effect.
      <right_margin> limits length of line with indent. Setting it
        makes sense for printing.
      <max_text_width> limits length of line without indent, i.e.
        length of text in line. Setting it makes sense for windowed
        viewing in editor.
      <keep_comments> is a flag to keep comments. Comment text is
        not changed so kept comments may last beyond right margin.

        ! Comments are "sinked-up" to statements level. So text

          function(a, --parameter "a"
            b) --parameter "b"
          end

        is treated as

          --parameter "a"
          function(a, b)
            --parameter "b"
          end

        This is done to keep formatting routines simple.


--
* Based on my own generic stream processing core,
  which is extended to generic strings parser,
  which uses my own loseless Lua syntax representation,
  produces AST (annotated syntax tree),
  which is further simplified and structured for code formatter,
  which produces code layout,
  trying all possible variants to fit code under given margins
  and maintain indentation.

* It uses local copy of my "workshop" code hive.
  Current version: https://github.com/martin-eden/workshop

* See also https://github.com/martin-eden/contents

--
2016-08-16
2017-01-28
2017-09-26
