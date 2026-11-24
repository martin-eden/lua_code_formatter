-- Serialize "local_named_function"

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
]]

return
  function(me, node)
    local printer = me[1]

    local dotted_name = node[1]
    local params = node[2]
    local body = node[3]

    printer:request_clean_line()
    printer:add_to_curline('local function ')
    if not me:process_node(dotted_name) then
      return
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
