-- Text block

--[[
  Author: Martin Eden
  Last mod.: 2026-11-13
]]

--[[
  Storage format

    1 [s] last line with text
    2 [i] number of newlines after line with text
    3 [t] indent instance
    4 [i] block width (maximum line length in stored list)
    5 [t] lines list
      0+ [s] line
]]

local flush
do
  local trim = request('!.string.trim_tail')
  local add_to_list = request('!.concepts.list.add_item')

  flush =
    function(me)
      add_to_list(me[5], trim(me[1]))
      for _ = 2, me[2] do
        add_to_list(me[5], '')
      end
      me[2] = 0

      me[1] = ''
    end
end

local add_to_textline
do
  local utf8_len = utf8.len
  local str_len = string.len
  local max = math.max
  add_to_textline =
    function(me, str)
      if (str == '') then return end
      if (me[1] == '') then
        me[1] = me[3]:to_string()
      end
      me[1] = me[1] .. str
      local len = utf8_len(me[1]) or str_len(me[1])
      me[4] = max(me[4], len)
    end
end

local add_to_curline =
  function(me, str)
    if (str == '') then return end
    if (me[2] > 0) then
      flush(me)
    end
    add_to_textline(me, str)
  end

local newline =
  function(me)
    me[2] = me[2] + 1
  end

local on_clean_line =
  function(me)
    return (me[1] == '') or (me[2] > 0)
  end

local request_clean_line =
  function(me)
    if not on_clean_line(me) then
      newline(me)
    end
  end

local request_empty_line =
  function(me)
    request_clean_line(me)
    if (me[2] == 1) then
      newline(me)
    end
  end

local inc_indent =
  function(me)
    me[3]:inc()
  end

local dec_indent =
  function(me)
    me[3]:dec()
  end

local get_text
do
  local lines_to_str = request('!.convert.lines_to_str')
  get_text =
    function(me)
      flush(me)
      return lines_to_str(me[5])
    end
end

local get_width =
  function(me)
    return me[4]
  end

local seed
do
  --[[
    Create a copy of ourselves but with empty lines history

    Lua code formatter is doing a lot of text variations.
    It needs quick instance copy, which can be later merged
    to parent instance if considered worthy.
  ]]
  --[[
    Setting text width (slot 4) to 0 in seed looks wrong.
    But in deed it updates in add_to_textline().
    If that isn't called, that zero will be wiped by max() in graft().
  ]]
  local utf8_len = utf8.len
  seed =
    function(me)
      local another_me =
        {
          [1] = me[1],
          [2] = me[2],
          [3] = new(me[3]),
          [4] = 0,
          [5] = { },
        }
      setmetatable(another_me, getmetatable(me))
      return another_me
    end
end

local graft
do
  --[[
    Merge with another our instance
  ]]
  local add_list = request('!.concepts.list.add_list')
  local max = math.max

  graft =
    function(me, another_me)
      me[1] = another_me[1]
      me[2] = another_me[2]
      me[4] = max(me[4], another_me[4])
      add_list(me[5], another_me[5])
    end
end

local interface
local create
do
  local indent = request('!.concepts.indent')
  local min_indent = 0
  local max_indent = 100
  local attach_methods = request('!.table.attach_methods')
  create =
    function(indent_chunk)
      assert_string(indent_chunk)
      local indent = indent.create(indent_chunk, min_indent, max_indent)
      local me =
        {
          [1] = '',
          [2] = 0,
          [3] = indent,
          [4] = 0,
          [5] = { },
        }
      attach_methods(me, interface)
      return me
    end
end

interface =
  {
    create = create,
    add_to_textline = add_to_textline,
    add_to_curline = add_to_curline,
    newline = newline,
    on_clean_line = on_clean_line,
    request_clean_line = request_clean_line,
    request_empty_line = request_empty_line,
    inc_indent = inc_indent,
    dec_indent = dec_indent,
    get_text = get_text,
    get_width = get_width,
    seed = seed,
    graft = graft,
  }

-- Export:
return interface

--[[
  2017 # # #
  2024 #
  2026 # # # # #
  2026-11-12
]]
