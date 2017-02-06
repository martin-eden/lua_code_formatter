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

return
  {
    handy = request('parser.handy'),
    link = request('parser.link'),
    optimize = request('parser.optimize'),
    parse = request('parser.parse'),
  }
