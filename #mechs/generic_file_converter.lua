local default_loader = request('^.workshop.load_from.lua.serialize_table.lua_code')

local serialize_func = request('^.workshop.save_to.lua.serialize_table.lua_code')
local serialize_func_params =
  {
    serializer =
      {
        always_index_keys = false,
        token_giver = request('^.workshop.compile.lua.token_givers.readable'),
        -- quote_string = request('^.workshop.compile.lua.quote_string.intact'),
      },
  }
local default_saver =
  function(t)
    if is_table(t) then
      return serialize_func(t, serialize_func_params)
    else
      return t
    end
  end

local default_params =
  {
    f_in_name = '',
    f_out_name = '',
    load = default_loader,
    save = default_saver,
  }

local override_params = request('^.workshop.handy_mechs.override_params')
local safe_open = request('^.workshop.file.safe_open')
local file_size = request('^.workshop.file.get_size')
local file_as_string = request('^.workshop.file.as_string')
local text_file_as_string = request('^.workshop.file.text_file_as_string')
local msg_with_time = request('msg_with_time')
local represent_size = request('represent_size')

return
  function(a_params)
    local par = override_params(default_params, a_params)
    if (par.f_in_name ~= '') and (par.f_out_name ~= '') then
      msg_with_time(
        ('Reading "%s" [%s].'):
        format(par.f_in_name, represent_size(file_size(par.f_in_name)))
      )
      local f_out = safe_open(par.f_out_name, 'w')
      local data_str = text_file_as_string(par.f_in_name)
      msg_with_time('Parsing.')
      local parse_result = par.load(data_str)
      if not parse_result then
        msg_with_time('Parse failed.')
      else
        collectgarbage()
        msg_with_time('Compiling result.')
        local compile_result = par.save(parse_result)
        if not compile_result then
          msg_with_time('Save failed.')
        else
          msg_with_time(
            ('Saving to "%s" [%s].'):
            format(par.f_out_name, represent_size(#compile_result))
          )
          f_out:write(compile_result)
          msg_with_time('Done.')
        end
      end
    else
      print('Usage: <f_in> <f_out>')
    end
  end
