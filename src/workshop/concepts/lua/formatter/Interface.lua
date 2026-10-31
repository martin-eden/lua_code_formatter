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
  local StateKeeperClass = request('StateKeeper')
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

      local StateKeeper = StateKeeperClass.create()

      local Me = { right_margin, Printer, StateKeeper }

      attach_methods(Me, Interface)

      return Me
    end
end

Interface =
  {
    create = create,

    Handlers = request('Handlers.Interface'),

    ProcessList = request('process_list'),
    ProcessNode = request('process_node'),

    ProcessBlock_Oneline = request('process_block_oneline'),
    ProcessBlock_Multiline = request('process_block_multiline'),
    ProcessBlock = request('process_block'),

    Represent = request('represent'),
    Variate = request('variate'),
    ProcessList_Variative = request('process_list_variative'),
  }

return Interface

--[[
  2016 #
  2017 # # #
  2018 #
  2026 # #
  2026-10-31
]]
