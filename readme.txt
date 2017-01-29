Description

  Formats any valid lua 5.3 code.

  Main advantage is that it wraps code lines to maintain readability.
  Efforts are made to represent code in more easy to understand form,
  not the shortest one.

  (
    This is a backport version for lua 5.1. Potentially it may
    have more problems and rarely updated. This is done to make
    tool available to most community who uses 5.1 for LuaJIT.
  )

Requirements

  Sole requirement is lua v5.1.


Installation

  sudo luarocks install lcf


Usage

  From command-line

    lua.reformat <fIn> <fOut>


  From lua interpreter

    Suppose you have a string with lua code and wish to get another
    string with formatted code.

    do
      local lua_code_str = 'do return end' -- < fill it

      require('lcf.workshop.base')
      local get_formatted_ast = request('lcf.workshop.load_from.lua')
      local get_formatted_code = request('lcf.workshop.save_to.lua')

      return get_formatted_code(get_formatted_ast(lua_code_str))
    end


    Passing formatting parameters

      You may override default parameters by passing a table with
      new values of changed parameters:

      get_formatted_code(
        get_formatted_ast(lua_code_str),
        {
          indent_chunk = '  ',
          right_margin = 100,
          max_text_width = 65,
        }
      )

      <indent_chunk> is a string using for building one indent.
        You may try '|..' to see it's effect.
      <right_margin> limits length of line with indent. Setting it
        makes sense for printring.
      <max_text_width> limits length of line without indent, i.e.
        length of text in line. Setting it makes sense for windowed
        viewing in editor.

--
* Built on my own general strings parser,
  which uses my own lua syntax representation,
  produces AST (annotated syntax tree),
  which is further structured for code formatter,
  which gets this structured AST and produce code layout,
  trying all possible variants to fit code in 70-symbol lines
  and maintain indentation.

* Currently comments are stripped from code. I'll add support
  for them someday (or will not and explain why).

* It uses local copy of my "workshop" code hive.
  Current version: https://github.com/martin-eden/workshop

* See also https://github.com/martin-eden/contents

--
2016-08-16
2017-01-03
2017-01-18
2017-01-22
2017-01-28
