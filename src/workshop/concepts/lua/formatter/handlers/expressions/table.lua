-- Serialize table

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

local oneliner =
  function(me, node)
    local printer = me[1]
    printer:add_to_curline('{ ')
    for idx, key_val in ipairs(node) do
      if (idx > 1) then
        printer:add_to_curline(', ')
      end
      local key = key_val.key
      if key then
        if not me:process_node(key) then
          return
        end
        printer:add_to_curline(' = ')
      end
      if not me:process_node(key_val.value) then
        return
      end
    end
    printer:add_to_curline(' }')
    return true
  end

local multiliner =
  function(me, node)
    local printer = me[1]

    printer:request_clean_line()
    printer:add_to_curline('{')

    printer:inc_indent()
    for _, key_val in ipairs(node) do
      printer:request_clean_line()
      local key, value = key_val.key, key_val.value
      if key then
        if not me:process_node(key) then
          return
        end
        printer:add_to_curline(' = ')
        if not me:process_block(value) then
          return
        end
        printer:add_to_textline(',')
      else
        if not me:process_node(value) then
          return
        end
        printer:add_to_textline(',')
      end
    end
    printer:dec_indent()

    printer:request_clean_line()
    printer:add_to_curline('}')
    return true
  end

return
  function(me, node)
    if (#node == 0) then
      me[1]:add_to_curline('{ }')
      return true
    else
      return me:variate(node, oneliner, multiliner)
    end
  end

--[[
  2016 #
  2017 # # #
  2018 #
]]
