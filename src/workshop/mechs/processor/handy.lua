--[[

  Handy functions for describing common constructions as "choice",
  "optional", "repeat", "not", "list" (like comma-separated values).

  "interleave" was experimental function to generate striped table:
  ({a, b}, ',') -> {a, ',', b, ','}. Currently not used and probably
  will be dropped.

  Performance is not important at this stage. We just create functions
  to generate grammar rules. And grammar rules are just tables with
  sequences and named fields.
]]

return
  {
    cho = request('handy.set_cho'),
    opt = request('handy.set_opt'),
    rep = request('handy.set_rep'),
    opt_rep = request('handy.set_opt_rep'),
    is_not = request('handy.set_neg'),
    list = request('handy.create_list_record'),
    interleave = request('handy.interleave'),
  }
