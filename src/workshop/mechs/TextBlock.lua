-- Text block

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
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
    function(Me)
      add_to_list(Me[5], trim(Me[1]))
      for _ = 2, Me[2] do
        add_to_list(Me[5], '')
      end
      Me[2] = 0

      Me[1] = ''
    end
end

local add_to_textline
do
  local utf8_len = utf8.len
  local max = math.max

  add_to_textline =
    function(Me, str)
      if (Me[1] == '') then
        Me[1] = Me[3]:ToString()
      end
      Me[1] = Me[1] .. str
      Me[4] = max(Me[4], utf8_len(Me[1]))
    end
end

local add_to_curline =
  function(Me, str)
    if (str == '') then return end
    if (Me[2] > 0) then
      flush(Me)
    end
    add_to_textline(Me, str)
  end

local newline =
  function(Me)
    Me[2] = Me[2] + 1
  end

local on_clean_line =
  function(Me)
    return (Me[1] == '') or (Me[2] > 0)
  end

local request_clean_line =
  function(Me)
    if not on_clean_line(Me) then
      newline(Me)
    end
  end

local request_empty_line =
  function(Me)
    request_clean_line(Me)
    if (Me[2] == 1) then
      newline(Me)
    end
  end

local inc_indent =
  function(Me)
    Me[3]:Inc()
  end

local dec_indent =
  function(Me)
    Me[3]:Dec()
  end

local get_text
do
  local lines_to_str = request('!.convert.lines_to_str')
  get_text =
    function(Me)
      flush(Me)
      return lines_to_str(Me[5])
    end
end

local get_width =
  function(Me)
    return Me[4]
  end

local seed
do
  --[[
    Create a copy of ourselves but with empty lines history

    Lua code formatter is doing a lot of text variations.
    It needs quick instance copy, which can be later merged
    to parent instance if considered worthy.
  ]]
  local utf8_len = utf8.len
  seed =
    function(Me)
      local AnotherMe =
        {
          [1] = Me[1],
          [2] = Me[2],
          [3] = new(Me[3]),
          [4] = utf8_len(Me[1]),
          [5] = { },
        }
      setmetatable(AnotherMe, getmetatable(Me))
      return AnotherMe
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
    function(Me, AnotherMe)
      Me[1] = AnotherMe[1]
      Me[2] = AnotherMe[2]
      Me[4] = max(Me[4], AnotherMe[4])
      add_list(Me[5], AnotherMe[5])
    end
end

local Interface
local create
do
  local Indent = request('!.concepts.Indent')
  local max_indent = 100
  local attach_methods = request('!.table.attach_methods')
  create =
    function(indent_chunk)
      local Indent = Indent.create()
      Indent:SetIndentChunk(indent_chunk)
      Indent:SetMaxIndentLevel(max_indent)

      local Me =
        {
          [1] = '',
          [2] = 0,
          [3] = Indent,
          [4] = 0,
          [5] = { },
        }
      attach_methods(Me, Interface)

      return Me
    end
end

Interface =
  {
    create = create,
    AddToTextline = add_to_textline,
    AddToCurline = add_to_curline,
    Newline = newline,
    OnCleanLine = on_clean_line,
    RequestCleanLine = request_clean_line,
    RequestEmptyLine = request_empty_line,
    IncIndent = inc_indent,
    DecIndent = dec_indent,
    GetText = get_text,
    GetWidth = get_width,
    Seed = seed,
    Graft = graft,
  }

-- Export:
return Interface

--[[
  2017 # # #
  2024 #
  2026 # #
  2026-10-22
]]
