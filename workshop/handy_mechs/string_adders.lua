local result =
  {
    array = request('string_adders.array'),
    file = request('string_adders.file'),
  }
result.default = result.file

return result
