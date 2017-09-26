return
  function(self)
    return
      (
        'Inner state:\n' ..
        '  f_in_name: "%s"\n' ..
        '  f_out_name: "%s"'
      ):
      format(
        self.f_in_name,
        self.f_out_name
      )
  end
