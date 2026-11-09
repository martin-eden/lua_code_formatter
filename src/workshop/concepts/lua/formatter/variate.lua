-- Looking for good representation

--[[
  Author: Martin Eden
  Last mod.: 2026-11-13
]]

local default_state =
  { is_multiline_allowed = true, is_last_hope = true }

return
  function(me, node, oneliner, multiliner)
    local printer = me[1]
    local margin = me[2]
    local state_keeper = me[3]

    state_keeper:next_level()
    local our_state = state_keeper:get_state() or default_state
    local is_multiline_allowed = our_state.is_multiline_allowed
    local is_last_hope = our_state.is_last_hope

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

        state_keeper:set_next_state(
          {
            is_multiline_allowed = is_multiline,
            is_last_hope = representer_is_last_hope,
          }
        )

        local trial, has_failed = me:represent(representer, node)

        if
          representer_is_last_hope or
          (
            not has_failed and
            (trial:get_width() <= margin)
          )
        then
          return trial
        end
      end

    local final

    if oneliner then
      final = do_represent(oneliner, false)
    end
    if
      not final and
      multiliner and
      is_multiline_allowed
    then
      final = do_represent(multiliner, true)
    end

    if final then
      printer:graft(final)
    end

    state_keeper:prev_level()

    return not is_nil(final)
  end

--[[
  2017 # # # #
  2026 #
  2026-10-31
]]
