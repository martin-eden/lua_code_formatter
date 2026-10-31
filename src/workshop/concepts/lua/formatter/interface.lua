-- AST formatter

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
  Internal storage format

    1 [i] -- right margin
    2 [t] -- printer
    3 [t] -- state keeper
]]

local Interface
local create
do
  local default_right_margin = 72
  local default_indent_chunk = '  '
  local TextBlock = request('!.mechs.TextBlock')
  local StateKeeper = request('state_keeper.interface')
  local attach_methods = request('!.table.attach_methods')
  create =
    function(Options)
      local Options = Options or { }

      local right_margin = Options.right_margin or default_right_margin

      local Printer
      do
        local indent_chunk = Options.indent_chunk or default_indent_chunk
        Printer = TextBlock.create(indent_chunk)
      end

      StateKeeper:init()

      local Me = { right_margin, Printer, StateKeeper }

      attach_methods(Me, Interface)

      return Me
    end
end

Interface =
  {
    create = create,

    handlers = request('handlers.interface'),

    process_list = request('process_list'),
    process_node = request('process_node'),

    process_block_oneline = request('process_block_oneline'),
    process_block_multiline = request('process_block_multiline'),
    process_block = request('process_block'),

    represent = request('represent'),
    variate = request('variate'),
    process_list_variative = request('process_list_variative'),

    representation_is_allowed = request('representation_is_allowed'),
  }

return Interface

--[[
  2016 #
  2017 # # #
  2018 #
  2026 # #
  2026-10-31
]]
