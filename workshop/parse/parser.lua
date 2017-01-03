-- Parse/verify given data with given structure

--[[
  The difference between parsing and verification is that
  parsing allocates memory and marks each symbol of data
  by substructure it belongs. Verification just reads data
  and assures it corresponds structure.

  For really highload use you should need some another tool. This
  tool is for exploring, experimenting, prototyping and hacking.

  2016-06-13
]]

local parse = request('parser.parse')

local link = request('parser.link')
local optimize = request('parser.optimize')

return
  {
    handy = request('parser.handy'),
    link = link,
    optimize = optimize,
    parse =
      function(struc, s)
        return parse(struc, s)
      end,
    verify =
      function(struc, s)
        return parse(struc, s, true)
      end
  }
