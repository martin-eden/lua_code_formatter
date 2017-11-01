--[[
  Pre-flight checks.
  Raises error if fails.
]]

local exists = request('!.file.exists')
local safe_open = request('!.file.safe_open')

return
  function(self)
    local f_in_name = self.f_in_name
    local f_out_name = self.f_out_name

    assert_string(f_in_name)
    if not exists(f_in_name) then
      error(('File "%s" not found.'):format(f_in_name))
    end

    assert_string(f_out_name)
    if (f_in_name == f_out_name) then
      error(('Input and output file names must differ.'))
    end

    -- Test that <f_out_name> is writable:
    local is_ok, f_out = pcall(safe_open, f_out_name, 'w')
    if not is_ok then
      local msg =
        ([[Can't open output file "%s" for writing: "%s".]]):
        format(f_out_name, f_out)
      error(msg)
    end
    f_out:close()
  end
