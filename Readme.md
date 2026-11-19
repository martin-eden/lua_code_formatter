[![DeepWiki][DeepWiki_Logo]][DeepWiki_Repo] will answer your questions

<table>
  <tr>
    <th colspan=3 align="center">Lua code formatter</th>
  </tr>
  <tr>
    <td>
      <table>
        <tr>
          <th>Updated</th>
          <td>2026-11-19</td>
        </tr>
        <tr>
          <th>Created</th>
          <td>2016</td>
        </tr>
        <tr>
          <th>License</th>
          <td>LGPL3</td>
        </tr>
        <tr>
          <th>Code size</th>
          <td>&lt; 140 K</td>
        </tr>
        <tr>
          <th>💾</th>
          <td>
            <a href="deploy/reformat_lua"><code>reformat_lua</code></a>
          </td>
        </tr>
      </table>
    </td>
    <td align="center">
      Reformats Lua 5.5 source code to fit right margin. Strips comments.
    </td>
    <td>
      <table>
        <tr>
          <th>Input</th>
          <th>Output</th>
        </tr>
        <tr>
          <td>
            <code>.lua</code>
          </td>
          <td>
            <code>.lua</code>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>


### Historical note

Initial version was relased in 2018. In 2026 I returned to this project
and did following changes:

  * No comments

    Comments are not considered part of code.

  * No Luarocks

    Now tool is self-sufficient file.

  * Changed scope

    Tool is positioned as machine-level code viewer.

    Same code with good and with bad formatting will converge to one
    result.

Feel free to tweak formatting routines to your taste but keep in mind
that visual niceness is not in the flight plan.


## Shipment

Repository contains

  * Compiled code in [`deploy/`](deploy/)
  * Sample input/output in [`test/`](test/)
  * Complete source code in [`src/`](src/)
  * Rebuild script and tools in [`builder/`](builder/)

### Requirements

* Linux
* Lua 5.5 (5.4, 5.3).


### Usage

#### From command-line

```
$ reformat_lua
Reformat Lua 5.5 code.

Usage:   f_in   f_out
       ┬      ┬       ┬
       │      │       │
       └── [options] ─┘

<options>:

  --indent=<str>        Use given string as indent chunk.
  --right-margin=<int>  Right margin.

-- Martin, 2026-11
```

#### From Lua interpreter

Suppose you have a string with Lua code and wish to get another string
with formatted code.

```Lua
do
  local lua_code_str = 'do return end' -- < fill it

  require('workshop.base')
  local reformat = request('!.lua.reformat_code')

  return reformat(lua_code_str)
end
```

##### Passing formatting parameters

You may override default parameters by passing a table with new values
of changed parameters:

```lua
reformat(
  lua_code_str,
  {
    indent_chunk = '  ',
    right_margin = 72,
  }
)
```

| Parameter      | Description                          |
| -------------- | ------------------------------------ |
| `indent_chunk` | String used for building one indent. |
| `right_margin` | Maximum line length with indent.     |


### Changing formatting logic

First, general workflow of this formatter:

1. Load `.lua` file as string.
2. Parse that string to tree.
3. Change nodes of that tree to make it easier to handle
  in formatting routines.
4. Run formatting routines for all nodes in the tree.
  Formatting routines write to virtual printer.
5. Write contents of virtual printer to file.

We are at point `4`. Start tinkering from something simple but usable
as "repeat" block handling:
`workshop/concepts/lua/formatter/handlers/statements/blocks/repeat_block.lua`

I've tried my best (again) to make code clear. Parsing, processing and
serializing source code of programming language is not trivial.


### See also

* [`workshop`][workshop] -- My personal Lua framework
* [My other projects][contents]


[DeepWiki_Logo]: https://deepwiki.com/badge.svg
[DeepWiki_Repo]: https://deepwiki.com/martin-eden/lua_code_formatter

[workshop]: https://github.com/martin-eden/workshop
[contents]: https://github.com/martin-eden/contents
