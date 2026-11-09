-- Extender for typed strings list. Works with [processor] and [parse].

--[[
  Author: Martin Eden
  Last mod.: 2026-11-19
]]

--[[
  For storage format see [seekable.input.types_strings].

  Here we're extending interface by adding three methods:
  is_name, is_string, is_number.

  We use them in syntax tree, so we need them as function references,
  not as invocations.
]]

local is_name =
  function(me)
    return me:match_type('name')
  end

local is_string =
  function(me)
    return me:match_type('string')
  end

local is_number =
  function(me)
    return me:match_type('number')
  end

local interface
local create
do
  local typed_strings_class =
    request('!.concepts.streams.seekable.input.typed_strings')
  local merge = request('!.table.merge')
  local attach_methods = request('!.table.attach_methods')
  create =
    function(tokens)
      local me = typed_strings_class.create(tokens)
      local base_interface = getmetatable(me).__index
      merge(interface, base_interface)
      attach_methods(me, interface)
      return me
    end
end

interface =
  {
    create = create,
    is_name = is_name,
    is_string = is_string,
    is_number = is_number,
  }

return interface

--[[
  2026-10-27
  2026-11-19
]]
