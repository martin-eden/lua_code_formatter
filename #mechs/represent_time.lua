local representer = request('^.workshop.handy_mechs.number_representer')
local override_params = request('^.workshop.handy_mechs.override_params')

representer =
  override_params(
    representer,
    {
      type = 'general_time',
      digits_display = 3,
    }
  )
representer:init()

return
  function(n)
    return representer:represent(n)
  end
