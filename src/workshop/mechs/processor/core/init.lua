--[[
  Preflight verifications.
]]

local assert_is_stream = request('!.mechs.streams.assert_is_stream')

return
  function(self)
    assert_is_stream(self.input_stream)
    assert_is_stream(self.output_stream)
  end
