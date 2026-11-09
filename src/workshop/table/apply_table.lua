-- Apply values to table A from table B following list of rules

--[[
  Author: Martin Eden
  Last mod.: 2026-11-10
]]

--[[
  Rules structure

    List of records with following structure

    {
      1 [b] -- value A is present
      2 [b] -- value B is present
      3 [s] -- action to apply for item in A
        replace -- replace value in A
        remove -- remove value in A
    }
]]

local replace_str = 'replace'
local remove_str = 'remove'

local assert_rule =
  function(rule)
    local action = rule[3]

    if
      is_boolean(rule[1]) and
      is_boolean(rule[2]) and
      (
        (action == replace_str) or
        (action == remove_str)
      )
    then
      return
    end

    error('Unsupported rule.')
  end

local apply_table
apply_table =
  function(a, b, rule)
    local keys = { }
    do
      for a_key in pairs(a) do
        keys[a_key] = true
      end
      for b_key in pairs(b) do
        keys[b_key] = true
      end
    end

    for key in pairs(keys) do
      local a_key = a[key]
      local b_key = b[key]

      if is_table(a_key) and is_table(b_key) then
        apply_table(a_key, b_key, rule)
      else
        local has_a = not is_nil(a_key)
        local has_b = not is_nil(b_key)

        local action
        if (rule[1] == has_a) and (rule[2] == has_b) then
          action = rule[3]
        end

        if (action == replace_str) then
          a[key] = b[key]
        elseif (action == remove_str) then
          a[key] = nil
        end
      end
    end
  end

-- Export:
return
  function(a, b, rule)
    assert_table(a)
    assert_table(b)
    assert_table(rule)
    assert_rule(rule)

    apply_table(a, b, rule)
  end

--[[
  2026 # # #
  2026-11-10
]]
