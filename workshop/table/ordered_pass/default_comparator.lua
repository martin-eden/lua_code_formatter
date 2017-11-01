local val_rank =
  {
    string = 1,
    number = 2,
    other = 3,
  }

local comparable_types =
  {
    number = true,
    string = true,
  }

return
  function(a, b)
    local a_key = a.key
    local a_key_type = type(a_key)
    local rank_a = val_rank[a_key_type] or val_rank.other

    local b_key = b.key
    local b_key_type = type(b_key)
    local rank_b = val_rank[b_key_type] or val_rank.other

    if (rank_a ~= rank_b) then
      return (rank_a < rank_b)
    else
      if comparable_types[a_key_type] and comparable_types[b_key_type] then
        return (a_key < b_key)
      else
        return (tostring(a_key) < tostring(b_key))
      end
    end
  end
