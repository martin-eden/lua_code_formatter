local c_marker = request('marker.interface')

return
  function(stream, struc)
    assert_table(stream)
    assert(is_table(struc) or is_string(struc) or is_function(struc))

    local marker = new(c_marker)
    marker:init(stream)
    local result = marker:match(struc)
    local data_struc = marker:get_struc()

    return result, data_struc
  end
