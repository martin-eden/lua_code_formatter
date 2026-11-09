-- String stream interface

--[[
  Author: Martin Eden
  Last mod.: 2026-11-10
]]

local force_merge = request('!.table.merge_and_patch')
local base_interface = request('^.interface')

local original_init = base_interface.init

local overrides =
  {
    init = request('init'),
    get_position = request('get_position'),
    set_position = request('set_position'),
    read = request('read'),
    get_length = request('get_length'),
    -- extensions:
    match_string = request('match_string'),
    match_regexp = request('match_regexp'),
    -- internal:
    s = nil,
    position = nil,
    original_init = original_init,
  }

local interface = new(base_interface)
force_merge(interface, overrides)

-- Export:
return interface

--[[
  2017-05
  2026-06-17
]]
