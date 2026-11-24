-- Serialize "if" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
]]

--[[
  Node structure

    1+ [t] -- clause
      type [s] -- one of ( if_part elseif_part else_part)
      // when not "else_part"
      1 [t] -- condition (expression)
      2 [t] -- statements
      // when "else_part"
      1 [t] -- statements
]]

local oneline_if =
  function(me, node)
    return me:process_block_oneline('if ', node, ' then')
  end

local multiline_if =
  function(me, node)
    return me:process_block_multiline('if', node, 'then')
  end

local oneline_elseif =
  function(me, node)
    return me:process_block_oneline('elseif ', node, ' then')
  end

local multiline_elseif =
  function(me, node)
    return me:process_block_multiline('elseif', node, 'then')
  end

return
  function(me, node)
    local printer = me[1]

    for i, clause in ipairs(node) do
      printer:request_clean_line()

      if (clause.type == 'else_part') then
        if not me:process_block_multiline('else', clause[1]) then
          return
        end
      else
        local oneliner
        local multiliner
        if (i == 1) then
          oneliner = oneline_if
          multiliner = multiline_if
        else
          oneliner = oneline_elseif
          multiliner = multiline_elseif
        end

        if not me:variate(clause[1], oneliner, multiliner) then
          return
        end

        printer:request_clean_line()
        if not me:process_block(clause[2]) then
          return
        end
      end
    end

    printer:request_clean_line()
    printer:add_to_curline('end')

    return true
  end

--[[
  2016 #
  2017 # # #
  2026 #
  2026-11-24
]]
