-- String stream interface

--[[
  Author: Martin Eden
  Last mod.: 2026-06-17
]]

-- Imports:
local force_merge = request('!.table.merge_and_patch')
local BaseInterface = new(request('^.interface'))

local original_init = BaseInterface.init

local Overrides =
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

local Interface = new(BaseInterface)
force_merge(Interface, Overrides)

-- Export:
return Interface

--[[
  2017-05
  2026-06-17
]]
