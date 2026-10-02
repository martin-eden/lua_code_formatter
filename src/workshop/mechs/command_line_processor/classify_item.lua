local flag_pattern = '^%-%-(~?)([%w%-]+)$'  -- --~keep-comments
local key_int_pattern = '^%-%-([%w%-]+)=(%d+)$'  -- --right-margin=40
local key_str_pattern = '^%-%-([%w%-]+)=(.*)$'  -- --indent-chunk=  |

return
  function(self, item)
    assert_string(item)

    local is_not, key, value

    is_not, key = item:match(flag_pattern)
    if key then
      return 'flag', key, (is_not == '')
    end

    key, value = item:match(key_int_pattern)
    if key then
      value = tonumber(value)
      assert_integer(value)
      return 'key_int', key, value
    end

    key, value = item:match(key_str_pattern)
    if key then
      return 'key_str', key, value
    end

    return 'string', nil, item
  end
