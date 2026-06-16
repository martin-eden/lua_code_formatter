--[[
  Fucken editors tend to save files in UTF-8 or UTF-16.
  In this case staring bytes are (EF BB BF), (FF FE) or (FE FF).
  They wrecks any further data parsing.

  This routine just strips UTF-8 sequence if found at start of file.
  UTF-16 sequences is not stripped as characters will be two-byte
  and parsing will fail anyway.
]]

local file_as_string = request('as_string')

local strip_prefixes =
  {
    '\xef\xbb\xbf',
  }

return
  function(file_name)
    local result = file_as_string(file_name)
    for i = 1, #strip_prefixes do
      local prefix = strip_prefixes[i]
      if (result:sub(1, #prefix) == prefix) then
        result = result:sub(#prefix + 1)
        break
      end
    end
    return result
  end
