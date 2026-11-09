-- Serialize "if" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
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

    printer:request_clean_line()
    if not me:variate(node.if_part.condition, oneline_if, multiline_if) then
      return
    end

    printer:request_clean_line()
    if not me:process_block(node.if_part.body) then
      return
    end

    if node.elseif_parts then
      for _, elseif_part in ipairs(node.elseif_parts) do
        printer:request_clean_line()
        if
          not me:variate(
            elseif_part.condition,
            oneline_elseif,
            multiline_elseif
          )
        then
          return
        end

        printer:request_clean_line()
        if not me:process_block(elseif_part.body) then
          return
        end
      end
    end

    if node.else_part then
      printer:request_clean_line()
      if not me:process_block_multiline('else', node.else_part.body) then
        return
      end
    end

    printer:request_clean_line()
    printer:add_to_curline('end')

    return true
  end

--[[
  2016 #
  2017 # # #
  2026-10-23
]]
