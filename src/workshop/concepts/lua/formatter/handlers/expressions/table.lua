-- Serialize table

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
]]

local get_key_val =
  function(rec)
    if (#rec == 2) then
      return rec[1], rec[2]
    elseif (#rec == 1) then
      return nil, rec[1]
    end
  end

return
  function(me, node)
    local oneliner =
      function(me, node)
        local printer = me[1]
        printer:add_to_curline('{ ')
        for idx, key_val in ipairs(node) do
          local key, value = get_key_val(key_val)
          if (idx > 1) then
            printer:add_to_curline(', ')
          end
          if key then
            if not me:process_node(key) then
              return
            end
            printer:add_to_curline(' = ')
          end
          if not me:process_node(value) then
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
          local key, value = get_key_val(key_val)
          printer:request_clean_line()
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
