-- Grammar matching core

--[[
  Author: Martin Eden
  Last mod.: 2026-11-18
]]

--[[
  It matches current position in input stream with rule and
  returns boolean result.

  Behavior depends of rule type:

    string - simple string matching

    function - calls that function and passes it input and output streams

    table - sequence of rules plus processing flags:
      op [?s] -- "neg" or "opt"
        "neg" - negate (invert) result,
        "opt" - optional rule (result is always true but try to match)
      f_rep [?b] -- repeat flag - flag to repeat processing until fail
      mode_choice [?b] - flag to handle sequence as choice
        true - choice: success if one rule matched
        false - sequence: success if all rules matched
      name [?s] - name of rule. Passed to handler of "match" event.

      In case of positive result and when <.name> is present,
      "on match" function is called with arguments of input stream,
      output stream, rule name, initial input stream position.

  In case of negative result positions in input and output streams
  are restored to what they were at start of this function.
]]

-- I am proud of this code

local match
match =
  function(me, rule)
    local rule_type = type(rule)
    if (rule_type == 'string') then
      return me[1]:match_string(rule)
    elseif (rule_type == 'function') then
      return rule(me[1], me[2])
    elseif (rule_type == 'table') then
      local op_neg = (rule.op == 'neg')
      local op_opt = (rule.op == 'opt')
      local f_rep = rule.f_rep
      if f_rep and op_neg then
        f_rep = nil
      end

      local rule_name = rule.name

      local result
      local repeat_result
      local mode_choice = rule.mode_choice
      local mode_seq = not mode_choice

      ::restart::

      local round_in_stream_pos = me[1]:get_position()
      local round_out_stream_pos = me[2]:get_position()

      if mode_seq then
        result = true
        for i = 1, #rule do
          if not match(me, rule[i]) then
            result = false
            break
          end
        end
      else
        -- mode_choice
        result = false
        for i = 1, #rule do
          if match(me, rule[i]) then
            result = true
            break
          end
        end
      end

      if not result then
        me[1]:set_position(round_in_stream_pos)
        me[2]:set_position(round_out_stream_pos)
      elseif rule_name then
        me[3](me[1], me[2], rule_name, round_in_stream_pos)
      end

      if f_rep then
        if result then
          repeat_result = true
          goto restart
        else
          result = repeat_result
        end
      end
      if op_opt then
        result = true
      elseif op_neg then
        result = not result
      end

      return result
    end
  end

-- Export:
return match

--[[
  2018
]]
