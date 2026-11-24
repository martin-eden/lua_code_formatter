-- Serialize "local" assignment

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
]]

return
  function(me, node)
    local name_list = node[1]
    local val_list = node[2]
    me[1]:add_to_curline('local ')
    if not me:process_block(name_list) then
      return
    end
    if val_list then
      me[1]:add_to_textline(' = ')
      return me:process_block(val_list)
    end
    return true
  end

--[[
  2016 #
  2017 # #
]]
