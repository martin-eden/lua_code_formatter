local keywords = request('keywords')

return
  function(s)
    return
      is_string(s) and
      s:match('^[%a_][%w_]*$') and
      not keywords[s]
  end
