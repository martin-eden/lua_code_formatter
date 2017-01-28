-- String concatter implementation as array with bounded upper size.

--[[
  After reaching some threshold all elements of array compressed to
  one element and garbage collection is performed.
]]

return
  {
    comfort_array_size = 4e6,
    maximum_array_size = 8e6,
    estimated_compression_to_act = math.sqrt(2),
    debug_output = false,
    data = {},
    table_rec_size = 52,
    total_data_len = 0,
    init =
      function(self)
        self.data = {}
        self.total_data_len = 0
      end,
    compress =
      function(self)
        self.data = {table.concat(self.data)}
        collectgarbage()
      end,
    add =
      function(self, term)
        self.data[#self.data + 1] = term
        self.total_data_len = self.total_data_len + #term
        if (#self.data > self.comfort_array_size) then
          local data_size = #self.data * self.table_rec_size + self.total_data_len
          local compressed_size = self.table_rec_size + self.total_data_len
          if
            (data_size / compressed_size > self.estimated_compression_to_act) or
            (#self.data > self.maximum_array_size)
          then
            local mem_before = collectgarbage('count') / 1024
            local num_els_before = #self.data
            self:compress()
            if self.debug_output then
              local mem_current = collectgarbage('count') / 1024
              print(
                ('[#%.0fk, %.0fMB, %.0fMB, %.1f]: [%.0fMiB] -> [%.0fMiB][%.0fMiB]'):
                format(
                  num_els_before / 1e3,
                  data_size / 1e6,
                  compressed_size / 1e6,
                  (data_size - compressed_size) / 1e6,
                  mem_before,
                  mem_current,
                  mem_before - mem_current
                )
              )
            end
          end
        end
      end,
    get_result =
      function(self)
        return table.concat(self.data)
      end,
  }
