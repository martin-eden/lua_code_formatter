return
  function(self)
    self.position = self:raw_get_position()
    self.cached_chunks = {}
    setmetatable(self.cached_chunks, {__mode = 'kv'})
  end
