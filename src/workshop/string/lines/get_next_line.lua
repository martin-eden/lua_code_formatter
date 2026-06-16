--[[
  Get line from given string and position. Return it with next line
  position.

  Input

    <str>
          <int>

  Output

    <int> <str>
          <nil>

  Notes

    * next() function format used.
    * Special cases handled:
      * Last line may not have tail newline. It handled as line
        anyway.
      * Source line may be empty. (1, <nil>) is returned.
]]

return
  function(s, start_pos)
    start_pos = start_pos or 1
    local start, finish, result = s:find('(.-)\n', start_pos)
    local new_start
    if not start then
      if (start_pos <= #s) then
        result = s:sub(start_pos)
        new_start = #s + 1
      end
    else
      new_start = finish + 1
    end
    return new_start, result
  end
