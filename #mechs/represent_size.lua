local representer = request('^.workshop.handy_mechs.number_representer')
local override_params = request('^.workshop.handy_mechs.override_params')

representer =
  override_params(
    representer,
    {
      type = 'binary_bytes',
      digits_display = 3,
    }
  )
representer:init()

return
  function(n)
    local result = representer:represent(n)
    return result
  end
