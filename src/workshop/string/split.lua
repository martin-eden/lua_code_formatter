-- Split string into pieces

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  Split delimited string into list

  String is always treated as it ends on delimiter.

  Cases/examples (Itness format):

    ( a/b / ) -> ( a b )
    ( [] [] ) -> ( [] )
    ( / / ) -> ( [] )
    ( a [] ) -> ( a )
    ( a / ) -> ( a )
    ( a/ / ) -> ( a )
    ( // / ) -> ( [] [] )
]]

local ends_with = request('!.string.ends_with')
local quote_regexp = request('!.lua.regexp.quote')
local str_find = string.find
local add_to_list = request('!.concepts.list.add_item')

return
  function(str, delimiter)
    assert_string(str)
    assert_string(delimiter)

    -- Special case: empty delimiter
    if (delimiter == '') then
      -- Return list with source string
      return { str }
    end

    if not ends_with(str, delimiter) then
      str = str .. delimiter
    end

    local item_capture = '(.-)' .. quote_regexp(delimiter) .. '()'
    local start_pos = 1
    local end_pos
    local item_str
    local result = { }

    while true do
      start_pos, end_pos, item_str =
        str_find(str, item_capture, start_pos)
      if not start_pos then break end
      add_to_list(result, item_str)
      start_pos = end_pos + 1
    end

    return result
  end

--[[
  2016 # #
  2026 # #
]]
