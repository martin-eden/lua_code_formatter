local patch
patch =
  function(t_src, t_patch)
    for k, v in pairs(t_patch) do
      if (t_src[k] == nil) then
        local err_msg =
          ('Destination table dont have key "%s".'):format(tostring(k))
        error(err_msg, 2)
      end
      if is_table(t_src[k]) and is_table(v) then
        patch(t_src[k], v)
      else
        t_src[k] = v
      end
    end
  end

return patch
