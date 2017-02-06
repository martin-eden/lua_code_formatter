-- Concatter implementation via writing to file.

--[[
  With comparision of array implementation:
  + speed
    In my case it's a bit (about 7%) faster that array implementation
    as it has no table maintenance overhead.

  + capacity
    Theoretically limited to size of disk storage

  - creates file on disk
    Writing can be painfully slow.
    Available disk size may be smaller than RAM size.
    Filling disk cause stability problems.
    Maximum file size depends of file system.
]]

local get_unique_file_name = request('^.^.file.get_unique_name')
local safe_open = request('^.^.file.safe_open')

local result =
  {
    --file_name
    --file
    init =
      function(self)
        self.file_name = get_unique_file_name()
        self.file = safe_open(self.file_name, 'a+b')
      end,
    free =
      function(self)
        if self.file then
          if (io.type(self.file) == 'file') then
            io.close(self.file)
          end
          os.remove(self.file_name)
        end
      end,
    add =
      function(self, s)
        self.file:write(s)
      end,
    get_result =
      function(self)
        self.file:flush()
        self.file:seek('set')
        local result
        result = self.file:read('a')
        self.file:seek('end')
        return result
      end,
  }

setmetatable(
  result,
  {
    __gc =
      function(self)
        self:free()
      end,
  }
)

return result
