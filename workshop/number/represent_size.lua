local representer = request('!.mechs.number.representer.interface')

representer =
  new(
    representer,
    {
      type = 'binary_bytes',
      digits_display = 3,
    }
  )
representer:init()

return
  function(n)
    return representer:represent(n)
  end
