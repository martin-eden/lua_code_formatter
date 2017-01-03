local get_metrics = request('get_text_metrics')
local quote = request('^.^.^.compile.lua.quote_string')

local max_right_margin = 70
-- local max_text_width = 70

return
  function(self, text)
    local metrics = get_metrics(text)

    local result
    -- result = (metrics.text_width <= max_text_width)
    result = (metrics.right_margin <= max_right_margin)

    return result
  end
