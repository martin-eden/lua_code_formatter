local text_block

local add =
  function(s)
    text_block:add_curline(s)
  end

local node_handlers = {}

local raw_compile = request('!.struc.compile')

local compile =
  function(t)
    add(raw_compile(t, node_handlers))
  end

local is_identifier = request('!.formats.lua.load.is_identifier')
local compact_sequences = true

node_handlers.table =
  function(node)
    if (#node == 0) then
      add('{}')
      return
    end
    local last_integer_key = 0
    add('{')
    for i = 1, #node do
      if (i > 1) then
        add(',')
      end
      local key, value = node[i].key, node[i].value
      -- skip key part?
      if
        compact_sequences and
        (key.type == 'number') and
        is_integer(key.value) and
        (key.value == last_integer_key + 1)
      then
        last_integer_key = key.value
      else
        -- may mention key without brackets?
        if
          (key.type == 'string') and
          is_identifier(key.value)
        then
          add(key.value)
        else
          add('[')
          compile(key)
          add(']')
        end
        add('=')
      end
      compile(value)
    end
    add('}')
  end

do
  local serialize_tostring =
    function(node)
      add(tostring(node.value))
    end

  local tostring_datatypes = {'number', 'boolean', 'nil'}

  for i = 1, #tostring_datatypes do
    node_handlers[tostring_datatypes[i]] = serialize_tostring
  end
end

do
  local quote_string = request('!.formats.lua.save.quote_string')

  local serialize_quoted =
    function(node)
      local quoted_string = quote_string(tostring(node.value))
      -- Quite ugly handling indexing [[[s]]] case: convert to [ [[s]]]
      if not text_block:on_clean_line() then
        local text_line = text_block.line_with_text:get_line()
        if
          (text_line:sub(-1) == '[') and
          (quoted_string:sub(1, 1) == '[')
        then
          add(' ')
        end
      end
      add(quoted_string)
    end

  local quoted_datatypes = {'string', 'function', 'thread', 'userdata'}

  for i = 1, #quoted_datatypes do
    node_handlers[quoted_datatypes[i]] = serialize_quoted
  end
end

node_handlers.name =
  function(node)
    compile(node.value)
  end

local merge = request('!.table.merge')

return
  function(a_node_handlers, a_text_block, options)
    node_handlers = merge(a_node_handlers, node_handlers)
    text_block = a_text_block
    if options and is_boolean(options.compact_sequences) then
      compact_sequences = options.compact_sequences
    end
  end
