local default_comparator = request('comparators.default')
local extract_keys = request('extract_keys')
local to_key_val = request('to_key_val')

-- Sort <t> and return iterator function to pass that sorted <t>
return
  function(t, comparator)
    assert_table(t)
    comparator = comparator or default_comparator
    assert_function(comparator)

    local key_vals = to_key_val(t)
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
