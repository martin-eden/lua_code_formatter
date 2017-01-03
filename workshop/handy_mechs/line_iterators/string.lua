return
  {
    s = nil,
    idx_start = nil,
    init =
      function(self, s)
        assert_string(s)
        self.s = s
        self.idx_start = 1
      end,
    get_next_line =
      function(self)
        local s = self.s
        local start, finish, result = s:find('(.-\n)', self.idx_start)
        if not start then
          if (self.idx_start <= #s) then
            result = s:sub(self.idx_start)
            self.idx_start = #s + 1
          end
        else
          self.idx_start = finish + 1
        end
        return result
      end,
  }
