local init =
  function(self)
    setmetatable(
      self.indents,
      {
        __index =
          function(t, key)
            if is_number(key) then
              key = math.floor(key)
              local value = self.indent_chunk:rep(key)
              t[key] = value
              return value
            end
          end,
      }
    )
  end

return
  {
    indents = {},

    init = init,
    indent_chunk = '  ',
  }
