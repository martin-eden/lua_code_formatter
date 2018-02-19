local text_block

local node_handlers = {}

local add =
  function(s)
    text_block:add_curline(s)
  end

local request_clean_line =
  function()
    text_block:request_clean_line()
  end

local raw_compile = request('!.struc.compile')

local compile =
  function(t)
    add(raw_compile(t, node_handlers))
  end

node_handlers.local_definition =
  function(node)
    request_clean_line()
    add('local ')
    compile(node.name)
    add(' = ')
    compile(node.value)
  end

local is_identifier = request('!.formats.lua.is_identifier')

node_handlers.index =
  function(node)
    if
      (node.value.type == 'string') and
      is_identifier(node.value.value)
    then
      add('.')
      add(node.value.value)
    else
      add('[')
      compile(node.value)
      add(']')
    end
  end

node_handlers.assignment =
  function(node)
    request_clean_line()
    add(node.name)
    compile(node.index)
    add(' = ')
    compile(node.value)
  end

node_handlers.return_statement =
  function(node)
    request_clean_line()
    add('return ')
    compile(node.value)
  end

local merge = request('!.table.merge')

return
  function(a_node_handlers, a_text_block)
    node_handlers = merge(a_node_handlers, node_handlers)
    text_block = a_text_block
  end
