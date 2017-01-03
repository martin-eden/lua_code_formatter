local init =
  function(self)
    setmetatable(
      self.indents,
      {
        __index =
          function(t, key)
            if is_integer(key) then
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
