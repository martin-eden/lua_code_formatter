-- Parse pathname string to list of names

--[[
  Author: Martin Eden
  Last mod.: 2026-11-11
]]

--[[
  Contract

  Input is a non-empty POSIX pathname string.

  Output is a list of name segments, built from these rules:

    * segments equal to "" or "." are dropped, except that a
      trailing "" is kept when the pathname denotes a directory,
      and a leading "" is kept when the pathname is absolute.

    * If, after dropping "" and ".", no name segments remain and
      the pathname is not absolute, the single segment "." is used
      (this is how "." and "./" are represented).

    * If the pathname is absolute, first list item is "".

    * If the pathname is a directory (ends in "/", ".", or ".."),
      last list item is "".

  List length is at least one. It equals one only for a plain
  relative name with no path separators, like "a".
]]

local split_string = request('!.string.split')
local check_is_absolute = request('is_absolute')
local check_is_directory = request('is_directory')
local add_to_list = request('!.concepts.list.add_item')
local add_list = request('!.concepts.list.add_list')

local empty = ''

local sep
local self_dir
do
  local syntels = request('syntels')
  sep = syntels.separator
  self_dir = syntels.self_dir
end

return
  function(path_name)
    assert_string(path_name)

    if (path_name == empty) then
      error('Empty pathname.')
    end

    local is_absolute
    local is_directory
    local names = { }
    do
      local segments = split_string(path_name .. sep, sep)

      is_absolute = check_is_absolute(segments)
      is_directory = check_is_directory(segments)

      for _, segment in ipairs(segments) do
        if (segment ~= empty) and (segment ~= self_dir) then
          add_to_list(names, segment)
        end
      end
    end

    if (#names == 0) and not is_absolute then
      add_to_list(names, self_dir)
    end

    local result = { }

    if is_absolute then
      add_to_list(result, empty)
    end

    add_list(result, names)

    if is_directory then
      add_to_list(result, empty)
    end

    return result
  end

--[[
  Notes

    * POSIX pathnames are elegant

      Don't treat them as strings. Treat them as slash-separated
      strings list.

    * Empty string as pathname is illegal in POSIX

      This code will process it as "/". But empty string is stupid,
      so empty string is under assert().

    * ".." element

      It does not interpret "a/b/.." as "a/" because "b" may be
      symlink to another directory.

  Examples (Itness format):

    '' -> error

    / -> ( [] [] )
    /. -> ditto

    . -> ( . [] )
    ./ -> ditto

    .. -> ( .. [] )
    ../ -> ditto
    ./.. -> ditto

    a -> ( a )

    /a -> ( [] a )

    a/ -> ( a [] )

    /a/ -> ( [] a [] )

    a/b -> ( a b )

    /.. -> ( [] .. [] )

    ././..//a/./. -> ( .. a [] )
]]

--[[
  2016 #
  2018 #
  2026 # # # # # # #
]]
