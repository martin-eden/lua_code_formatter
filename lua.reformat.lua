package.path = package.path .. ';../../../../?.lua;../?.lua'
require('workshop.base')

local load_lua = request('workshop.load_from.lua')
local pretty_lua = request('workshop.save_to.lua')

local convert = request('#mechs.generic_file_converter')
convert(
  {
    f_in_name = arg[1],
    f_out_name = arg[2],
    load =
      function(str)
        return pretty_lua(load_lua(str))
      end,
  }
)

--local deploy_script = request('workshop.save_to.deploy_script')
--deploy_script.save_script()
