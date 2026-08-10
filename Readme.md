| Created | Updated |  Size   | License  |
|:-------:|:-------:|:-------:|:--------:|
| 2016    | 2026-10 | < 200 K | LGPL3    |

### What

Formats any valid Lua 5.3 code.

Lines with code are wrapped to fit inside given margins.

Installation deploys three command-line scripts:

  * `lua.reformat`
  * `lua.get_ast`
  * `lua.get_formatter_ast`

Last two for people who love tinkering.

### Historical note

Initial version was relased in 2018. In 2026 I returned to this project
and did following chnages:

  * No comments

    Comments are not considered part of code.

  * Changed tool scope

    This tool is positioned as machine-level code viewer.

    So no matter how bad and dirty is source code, it will reduce
    it to some canonic form.

    Back side is that it will make code you like look worse.

Feel free to tweak formatting routines to your taste but keep in mind
that visual niceness (like empty lines before "return") is not in
flight plan.

---

### Requirements

* Linux
* Lua 5.5 (5.4, 5.3).


### Installation/Removal

Tool is standalone Lua file in `deploy/`.

---

### Usage

#### From command-line

`reformat_lia <input_file> <output_file>`

#### From Lua interpreter

Suppose you have a string with Lua code and wish to get another string
with formatted code.

```Lua
do
  local lua_code_str = 'do return end' -- < fill it

  require('workshop.base')
  local get_ast = request('!.lua.code.get_ast')
  local get_formatted_code = request('!.lua.code.ast_as_code')

  return get_formatted_code(get_ast(lua_code_str))
end
```

##### Passing formatting parameters

You may override default parameters by passing a table with new values
of changed parameters:

```lua
get_formatted_code(
  get_ast(lua_code_str),
  {
    indent_chunk = '  ',
    right_margin = 96,
    max_text_width = math.huge,
  }
)
```

| Parameter      | Default | Description                          |
| -------------- | :-----: | ------------------------------------ |
| `indent_chunk` | ` ` ` ` | String used for building one indent. |
| `right_margin` | 72      | Maximum line length with indent.     |

---

### Changing formatting logic

First, general workflow of this formatter:

1. Load `.lua` file as string.
2. Parse that string to tree in table.
3. Change nodes of that tree to make it easier to handle in formatting
  routines.
4. Run formatting routines for all nodes in tree. Formatting routines
  output to virtual printer.
5. Write contents of virtual printer to file.

We are at point `4`. Start tinkering from something simple but usable
as "repeat" block handling:
`workshop/formats/lua/formatter/handlers/statements/blocks/repeat_block.lua`

---

### Contributors

* `Peter Melnichenko ♰` shown me how to write cross-platform
  `.rockspec` file.
* `Oliver Jan Krylow` added cautions in `readme.md` that file with
  invalid syntax loses tail. I've mentioned `$ luac -p` workaround
  and added `--keep-unparsed-tail` option to detect and prevent
  this.
* `keneanung` adoped formatter to Lua 5.1 syntax and pushed branch
  `5.1-syntax_5.1`. Main audience of this is LuaJIT users.

---

### See also
* [My other repositories](https://github.com/martin-eden/contents).

---

[notes]: Notes.md
