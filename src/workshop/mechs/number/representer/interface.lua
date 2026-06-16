return
  {
    type = 'binary_bytes',
    digits_display = 3,
    init = function(self) end,
    represent = request('represent'),

    units = request('units.interface'),
    max_part_digits = 16,
  }
