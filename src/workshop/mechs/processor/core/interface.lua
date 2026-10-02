--[[
  Grammar processor interface.

  Assumed usage:
    1:
      * Set <input_stream>.
      * Set <output_stream>.
      * Set <on_match> handler.
    2. Call <init>.
    3. Call <match>.
]]

return
  {
    input_stream = nil,
    output_stream = nil,

    on_match = request('on_match'),

    init = request('init'),
    match = request('match'),
  }
