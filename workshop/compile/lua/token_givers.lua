local token_givers =
  {
    minimal = request('token_givers.minimal'),
    readable = request('token_givers.readable'),
    manageable = request('token_givers.manageable'),
  }
token_givers.default = token_givers.readable

return token_givers
