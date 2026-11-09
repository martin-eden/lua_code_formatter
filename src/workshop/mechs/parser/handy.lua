-- Export handy helper functions

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

local spawn_match_function
do
  local start_regexp = '^'
  local starts_with = request('!.string.starts_with')
  spawn_match_function =
    function(pattern)
      assert_string(pattern)
      assert(pattern ~= '')
      if not starts_with(pattern, start_regexp) then
        pattern = start_regexp .. pattern
      end
      return
        function(stream)
          return stream:match_regexp(pattern)
        end
    end
end

local any_char =
  function(stream)
    return stream:block_read(1)
  end

return
  {
    match_regexp = spawn_match_function,
    any_char = any_char,
  }

--[[
  2016
  2017
  2018
]]
