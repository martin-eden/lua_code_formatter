local parser = request('^.^.^.parser')
local handy = parser.handy

local int_10 = request('dec_number.int_10')
local frac_point = request('frac_point')

local dec_base =
  handy.cho1(
    {
      frac_point,
      int_10,
    },
    {
      int_10,
      handy.opt(
        frac_point,
        handy.opt(int_10)
      )
    }
  )

local exp_sign = request('exp_sign')

local dec_power =
  {
    handy.cho1('e', 'E'),
    handy.opt(exp_sign),
    int_10
  }

return
  {
    dec_base,
    handy.opt(dec_power)
  }
