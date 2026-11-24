-- Serialize global function

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
]]

return
  function(me, node)
    local printer = me[1]

    local dotted_name = node[1]
    local colon_name
    local params
    local body
    do
      local seek_pos = 2

      if (node[seek_pos].type == 'colon_name') then
        colon_name = node[seek_pos]
        seek_pos = seek_pos + 1
      end

      params = node[seek_pos]
      seek_pos = seek_pos + 1

      body = node[seek_pos]
    end

    printer:request_clean_line()
    printer:add_to_curline('function ')
    if not me:process_node(dotted_name) then
      return
    end
    if colon_name then
      if not me:process_node(colon_name) then
        return
      end
    end
    if not me:process_node(params) then
      return
    end

    printer:request_clean_line()
    if not me:process_block_multiline(nil, body, 'end') then
      return
    end

    printer:request_clean_line()
    return true
  end

--[[
  2016 #
  2017 # # # #
  2026-10-28
]]
