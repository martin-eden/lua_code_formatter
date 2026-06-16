local default_comparator = request('ordered_pass.default_comparator')
local get_key_vals = request('get_key_vals')

-- Sort <t> and return iterator function to pass that sorted <t>
return
  function(t, comparator)
    assert_table(t)
    comparator = comparator or default_comparator
    assert_function(comparator)

    local key_vals = get_key_vals(t)
    table.sort(key_vals, comparator)

    local i = 0
    local sorted_next =
      function()
        i = i + 1
        if key_vals[i] then
          return key_vals[i].key, key_vals[i].value
        end
      end

    return sorted_next, t
  end
