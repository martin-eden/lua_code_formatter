-- Create plan to visit nodes bottom-up

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

local dfs = request('dfs')
local add_to_list = request('!.concepts.list.add_item')

return
  function(graph, options)
    local assembly_order_seq = { }
    local handle_leave =
      function(node)
        add_to_list(assembly_order_seq, node)
      end
    options = options or { }
    options.handle_leave = handle_leave
    local node_recs = dfs(graph, options)
    return node_recs, assembly_order_seq
  end

--[[
  2016
]]
