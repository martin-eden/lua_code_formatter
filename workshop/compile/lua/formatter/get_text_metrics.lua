-- Probably this function should be moved somewhere out of virtual printer.

local line_iterator = request('^.^.^.handy_mechs.line_iterators.string')
local trim_linefeed = request('^.^.^.string.trim_linefeed')

return
  function(s)
    local num_lines = 0
    local text_width = 0
    local right_margin = 0

    local iterator = new(line_iterator)
    iterator:init(s)
    while true do
      local l = iterator:get_next_line()
      if not l then
        break
      end
      l = trim_linefeed(l)
      right_margin = math.max(right_margin, utf8.len(l))
      l = l:gsub('^%s+', '')
      text_width = math.max(text_width, utf8.len(l))
      num_lines = num_lines + 1
    end

    return
      {
        num_lines = num_lines,
        text_width = text_width,
        right_margin = right_margin,
      }
  end
