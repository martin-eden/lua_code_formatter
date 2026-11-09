-- Encode string to shell syntax

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  Examples

    -> ''
    ' -> \'
    a# -> a#
    #a -> '#a'
    a b -> 'a b'
]]

local empty = ''
local single_quote
local backslash
do
  local ascii_chars = request('!.concepts.ascii.chars')
  single_quote = ascii_chars.single_quote
  backslash = ascii_chars.backslash
end

local list_to_str = request('!.concepts.list.to_string')
local str_find = string.find

local needs_quoting
do
  local special_chars_regexp
  local starts_with_comment_regexp
  do
    local quote_regexp = request('!.lua.regexp.quote')
    do
      local special_chars = request('quote.special_chars')
      local special_chars_str = list_to_str(special_chars)
      special_chars_regexp = '[' .. quote_regexp(special_chars_str) .. ']'
    end
    do
      local space_chars = request('quote.space_chars')
      local space_chars_str = list_to_str(space_chars)
      local space_chars_regexp = '[' .. quote_regexp(space_chars_str) .. ']'
      local comment_char = '#'
      starts_with_comment_regexp = '^' .. space_chars_regexp .. '+' .. comment_char
    end
  end
  needs_quoting =
    function(str)
      return
        (str == empty) or
        not is_nil(str_find(str, special_chars_regexp)) or
        not is_nil(str_find(str, starts_with_comment_regexp))
    end
end

local split_string = request('!.string.split')
local add_to_list = request('!.concepts.list.add_item')

--[[
  * We're quoting only when it's needed

    F.e. [a;b] is quoted. But [a=b] is not.

    Or [a#] is not quoted but [#a] can be treated as comment and
    so it is quoted.

  * We're using single-quotes

    Happy case is when string does not contain ['].
    Then we just surround it with ['].

    If string contains ['] we'll split it by ['],
    quote parts, and glue with [\'].

  * ['] can be represented as [\'] or as ["'"] or as [\039] or as ...

    We'll use [\'].
]]
local quote
quote =
  function(str)
    assert_string(str)

    if not needs_quoting(str) then return str end

    if not str_find(str, single_quote) then
      return single_quote .. str .. single_quote
    end

    str = str .. single_quote

    local raw_items = split_string(str, single_quote)
    local items = { }

    for _, item in ipairs(raw_items) do
      local quoted_item
      if (item == empty) then
        -- Empty string is part here. No need to quote it
        quoted_item = empty
      else
        quoted_item = quote(item)
      end

      add_to_list(items, quoted_item)
    end

    return list_to_str(items, backslash .. single_quote)
  end

return quote

--[[
  2026-01-12
  2026-06-09
]]
