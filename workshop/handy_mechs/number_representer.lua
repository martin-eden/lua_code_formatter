local t =
  {
    binary_units =
      {
        [0] = {1024, ''},
        [1] = {1024, 'Ki'},
        [2] = {1024, 'Mi'},
        [3] = {1024, 'Gi'},
        [4] = {1024, 'Ti'},
        [5] = {1024, 'Pi'},
        [6] = {1024, 'Ei'},
        [7] = {1024, 'Zi'},
        [8] = {1024, 'Yi'},
      },
    binary_bytes =
      {
        [0] = {1024, ''},
        [1] = {1024, 'KiB'},
        [2] = {1024, 'MiB'},
        [3] = {1024, 'GiB'},
        [4] = {1024, 'TiB'},
        [5] = {1024, 'PiB'},
        [6] = {1024, 'EiB'},
        [7] = {1024, 'ZiB'},
        [8] = {1024, 'YiB'},
      },
    general_number =
      {
        [-8] = {1000, 'y'},
        [-7] = {1000, 'z'},
        [-6] = {1000, 'a'},
        [-5] = {1000, 'f'},
        [-4] = {1000, 'p'},
        [-3] = {1000, 'n'},
        [-2] = {1000, 'mcr'},
        [-1] = {1000, 'm'},
        [0] = {1000, ''},
        [1] = {1000, 'k'},
        [2] = {1000, 'M'},
        [3] = {1000, 'G'},
        [4] = {1000, 'T'},
        [5] = {1000, 'P'},
        [6] = {1000, 'E'},
        [7] = {1000, 'Z'},
        [8] = {1000, 'Y'},
      },
    general_time =
      {
        [-8] = {1000, 'ys'},
        [-7] = {1000, 'zs'},
        [-6] = {1000, 'as'},
        [-5] = {1000, 'fs'},
        [-4] = {1000, 'ps'},
        [-3] = {1000, 'ns'},
        [-2] = {1000, 'mcrs'},
        [-1] = {1000, 'ms'},
        [0] = {1000, 's'},
        [1] = {3600, 'hr'},
        [2] = {24, 'day'},
        [3] = {365.2425, 'y'},
        [4] = {1000, 'Ky'},
        [5] = {1000, 'My'},
        [6] = {1000, 'Gy'},
        [7] = {1000, 'Ty'},
        [8] = {1000, 'Py'},
      },
  }

local max_part_digits = 16

return
  {
    type = 'binary_bytes',
    digits_display = 3,
    init = function(self) end,
    represent =
      function(self, n)
        assert_number(n)
        if not t[self.type] then
          error(('Have no settings for type "%s".'):format(self.type), 2)
        end
        local pos = 0
        local units = t[self.type]
        local is_neg = (n < 0)
        n = math.abs(n)

        ::redo::
        local int_part, frac_part = math.modf(n)
        -- print(self.type, int_part, frac_part, pos, n)
        if units[pos - 1] and (int_part == 0) then
          n = n * units[pos][1]
          pos = pos - 1
          goto redo
        end
        if units[pos + 1] and (int_part >= units[pos + 1][1]) then
          pos = pos + 1
          n = n / units[pos][1]
          goto redo
        end

        local unit_name = units[pos][2]
        local s_int = ('%d'):format(int_part)

        local digits_remained = self.digits_display - #s_int
        digits_remained = math.min(digits_remained, max_part_digits)

        local has_eps = (frac_part > 0)
        local s_frac = ''

        if (digits_remained > 0) then
          frac_part = math.floor(frac_part * 10 ^ digits_remained)
          s_frac = ('%0' .. digits_remained .. 'd'):format(frac_part)
          s_frac = '.' .. (s_frac):sub(1, digits_remained)
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
      end,
  }
