return
  function(self, n)
    assert_number(n)
    if not self.units[self.type] then
      error(('Have no settings for type "%s".'):format(self.type), 2)
    end
    local pos = 0
    local powers = self.units[self.type]
    local is_neg = (n < 0)
    n = math.abs(n)

    ::redo::
    local int_part, frac_part = math.modf(n)
    -- print(self.type, int_part, frac_part, pos, n)
    if powers[pos - 1] and (int_part == 0) then
      n = n * powers[pos][1]
      pos = pos - 1
      goto redo
    end
    if powers[pos + 1] and (int_part >= powers[pos + 1][1]) then
      pos = pos + 1
      n = n / powers[pos][1]
      goto redo
    end

    local unit_name = powers[pos][2]
    local s_int = ('%d'):format(int_part)

    local digits_remained = self.digits_display - #s_int
    digits_remained = math.min(digits_remained, self.max_part_digits)

    local has_eps = (frac_part > 0)
    local s_frac = ''

    if (digits_remained > 0) then
      frac_part = math.floor(frac_part * 10 ^ digits_remained)
      -- Do not add zero fraction part: ".00".
      if (frac_part > 0) then
        s_frac = ('%0' .. digits_remained .. 'd'):format(frac_part)
        s_frac = '.' .. (s_frac):sub(1, digits_remained)
      end
    end

    local result

    if (int_part == 0) and (frac_part == 0) and has_eps then
      result = 'EPS'
    else
      result = s_int .. s_frac
    end

    if is_neg then
      result = '-' .. result
    end

    result = result .. unit_name

    return result
  end
