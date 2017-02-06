Description

  Formats any valid lua 5.3 code.

  Main advantage is that it wraps code lines to maintain readability.
  Efforts are made to represent code in more easy to understand form,
  not the shortest one.


Requirements

  Sole requirement is lua v5.3. Earlier versions will not work.
  (I've made a backport for lua v5.1. See "5.1" branch.)


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

* It uses local copy of my "workshop" code hive.
  Current version: https://github.com/martin-eden/workshop

* See also https://github.com/martin-eden/contents

* Why comments is stripped?

  Silly license texts in every source file, largely self-advertising
  comments, documentation embedded in code, ascii-lines and boxes -
  all this is junk to me. There are also good, well-written comments
  which is valuable. But this code can not judge comment quality.

  Will of this code is to reduce entropy. My will when running this
  code is reduce entropy. If I see that code has good comments,
  almost always it has good formatting too. So no need to use
  this tool for it.

--
2016-08-16
2017-01-03
2017-01-18
2017-01-22
2017-01-28
