-- Grammar processor

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

--[[
  Storage format

    1 [t] -- input stream
    2 [t] -- output stream
    3 [f] -- callback on match
      Receives following arguments
        1 [t] -- input stream
        2 [t] -- output stream
        3 [t] -- grammar node
        4 [i] -- position where grammar node starts
]]

local match = request('processor.match')

local interface
local create
do
  local assert_is_stream = request('!.mechs.streams.assert_is_stream')
  local attach_methods = request('!.table.attach_methods')
  create =
    function(input, output, on_match)
      assert_is_stream(input)
      assert_is_stream(output)
      assert_function(on_match)
      local me = { input, output, on_match}
      attach_methods(me, interface)
      return me
    end
end

interface =
  {
    create = create,
    match = match,
  }

return interface

--[[
  2017
  2018
  2026-11-12
]]
