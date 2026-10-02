-- Looking for good representation

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

local DefaultState = { is_multiline_allowed = true, is_last_hope = true }

return
  function(Me, Node, oneliner, multiliner)
    Me.state_keeper:enter_level()
    local OurState = Me.state_keeper:get_state() or DefaultState
    local is_multiline_allowed = OurState.is_multiline_allowed
    local is_last_hope = OurState.is_last_hope

    local last_hope_handler
    if multiliner and is_multiline_allowed then
      last_hope_handler = multiliner
    else
      last_hope_handler = oneliner
    end

    local do_represent =
      function(representer, is_multiline)
        local representer_is_last_hope =
          is_last_hope and (representer == last_hope_handler)

        Me.state_keeper:set_child_state(
          {
            is_multiline_allowed = is_multiline,
            is_last_hope = representer_is_last_hope,
          }
        )

        local TrialRepresentation, has_failed = Me:represent(representer, Node)

        if
          representer_is_last_hope or
          (
            not has_failed and
            Me:representation_is_allowed(TrialRepresentation)
          )
        then
          return TrialRepresentation
        end
      end

    local FinalRepresentation

    if oneliner then
      FinalRepresentation = do_represent(oneliner, false)
    end
    if
      not FinalRepresentation and
      multiliner and
      is_multiline_allowed
    then
      FinalRepresentation = do_represent(multiliner, true)
    end

    if FinalRepresentation then
      Me.printer:Graft(FinalRepresentation)
    end

    Me.state_keeper:leave_level()

    return not is_nil(FinalRepresentation)
  end

--[[
  2017 # # # #
  2026-10-22
]]
