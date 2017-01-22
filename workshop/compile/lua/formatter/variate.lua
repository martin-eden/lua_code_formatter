--[[
  The most annouying problem is that we do not know what sort of
  handler we call: will it use variate() or not. Also normal handlers
  do not return result values. So handlers that use variate()
  return result in <printer.has_failed_to_represent>. We nullify this
  field before calling handler and check it's value after. If it is
  not nil, handler used variate() and we handle this accordingly.

  Another problem is that we should return result even it is not
  valid in terms of <multiline_allowed> and representation_is_allowed().
  This is for case when we have no other choice.
  --
  Current architecture easily becomes a performance black hole.
  Consider we are formatting a statement "a = {z = {}}". It parsed
  to something like

    <assignment>("a", <table>( ("z", <table>() ) ) )

  Both <assignment> and <table> have one-line and multiline versions.
  So we iterate from multiline to oneline as

    <assignment-m> <table-m> <table-m>
                             <table-1>
                   <table-1> <table-1>
    <assignment-1> <table-1> <table-1>

  The problem is that internal nodes called many times for same
  values, differed only by parent function who called it and usually
  by indentation in "printer" device abstraction.

  Also for a table with many values we anyway call one-line version
  which will fail in representation_is_allowed() function.
]]

local states = {}

local add =
  function(state)
    states[#states + 1] = state
  end

local get =
  function()
    return states[#states]
  end

local is_empty =
  function()
    return (#states == 0)
  end

local remove =
  function()
    states[#states] = nil
  end

local is_multiline_allowed =
  function()
    if is_empty() then
      return true
    else
      return get()
    end
  end

local get_representer_fields =
  function(representer)
    local handler, is_multiline
    if is_function(representer) then
      handler = representer
      is_multiline = false
    elseif is_table(representer) then
      handler = representer[1]
      is_multiline = representer.is_multiline or false
    end
    assert_function(handler)
    return handler, is_multiline
  end

local get_default_representer_idx =
  function(representers)
    local is_multiline_allowed = is_multiline_allowed()
    for i = 1, #representers do
      local handler, is_multiline = get_representer_fields(representers[i])
      if (is_multiline and is_multiline_allowed) then
        return i
      end
    end
    for i = 1, #representers do
      local handler, is_multiline = get_representer_fields(representers[i])
      if (not is_multiline and not is_multiline_allowed) then
        return i
      end
    end
    for i = 1, #representers do
      local handler, is_multiline = get_representer_fields(representers[i])
      if (not is_multiline and is_multiline_allowed) then
        return i
      end
    end
    for i = 1, #representers do
      local handler, is_multiline = get_representer_fields(representers[i])
      if (is_multiline and not is_multiline_allowed) then
        return i
      end
    end
    return 1
  end

local printer_class = request('^.^.^.string.text_block.interface')

local represent =
  function(self, representer, node)
    local original_presentation = self.printer

    local trial_presentation = new(printer_class)
    trial_presentation:init()
    local num_lines = #original_presentation.lines
    trial_presentation.lines[1] = original_presentation.lines[num_lines]
    trial_presentation.line_indents[1] = original_presentation.line_indents[num_lines]
    trial_presentation.next_line_indent = original_presentation.next_line_indent

    local handler, is_multiline = get_representer_fields(representer)

    self.printer = trial_presentation
    add(is_multiline)

    handler(self, node)

    remove()
    local has_failed
    if is_nil(trial_presentation.has_failed_to_represent) then
      has_failed = false
    else
      has_failed = trial_presentation.has_failed_to_represent
    end
    if not is_multiline and (#trial_presentation.lines > 1) then
      has_failed = true
    end

    -- print(('[\n%s\n]'):format(self.printer:get_text()))
    -- print(('text %s lines'):format(#self.printer.lines))
    self.printer = original_presentation

    return trial_presentation, has_failed
  end

return
  function(self, representers, node)
    local default_handler_idx = get_default_representer_idx(representers)
    local representation, default_representation

    self.printer.has_failed_to_represent = false

    --[[
      Iterate representers until fail. Also store failsafe
      representation if it occured.
    ]]
    -- [[
    for i = 1, #representers do
      local handler, is_multiline = get_representer_fields(representers[i])
      if
        is_multiline_allowed() or
        (not is_multiline_allowed() and not is_multiline)
      then
        local trial_presentation, has_failed =
          represent(self, representers[i], node)
        if
          not has_failed and
          self:representation_is_allowed(trial_presentation)
        then
          representation = trial_presentation
        else
          if (i == default_handler_idx) then
            default_representation = trial_presentation
          end
          break
        end
      end
    end
    --]]

    if not representation then
      if not default_representation then
        default_representation =
          represent(self, representers[default_handler_idx], node)
      end
      representation = default_representation
      self.printer.has_failed_to_represent = true
    end

    self.printer.lines[#self.printer.lines] = ''
    self.printer:concat_text_block(representation, true)
  end
