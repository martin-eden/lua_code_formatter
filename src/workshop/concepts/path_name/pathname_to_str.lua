-- Compile list of names to directory path

--[[
  Author: Martin Eden
  Last mod.: 2026-11-11
]]

local sep = request('syntels').separator

local clean_pathname
do
  local clean_name
  do
    local ends_with = request('!.string.ends_with')
    local str_sub = string.sub
    clean_name =
      function(name)
        local sep_len = #sep
        while ends_with(name, sep) do
          name = str_sub(name, 1, -(sep_len + 1))
        end
        return name
      end
  end
  local add_to_list = request('!.concepts.list.add_item')
  clean_pathname =
    function(pathname)
      local Result = { }
      for _, name in ipairs(pathname) do
        add_to_list(Result, clean_name(name))
      end
      return Result
    end
end

local list_to_str = request('!.concepts.list.to_string')

-- Export:
return
  function(pathname)
    return list_to_str(clean_pathname(pathname), sep)
  end

--[[
  2026 #
  2026-09-08
]]
