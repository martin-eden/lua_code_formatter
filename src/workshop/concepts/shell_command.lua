-- Shell command concept

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12

--[[
  Storage format

    1 [t] -- command and list of arguments
      1 [s] -- command
      1+ [s] -- argument
]]

--[[
  This module quotes command and arguments if needed,
  so it's safe to use special characters in them.

  It won't suit you for cases when you really
  want fancy stuff like "sh -c ls 2>/dev/null".
]]

--[[
  Examples

    Creating instance for "ls -l ~"

      local command = shell_command.create({ 'ls', '-l', '~' })

    Serializing

      command:to_string()

    Executing

      command:execute()
]]

local to_string
do
  local quote = request('!.concepts.shell.quote')
  local add_to_list = request('!.concepts.list.add_item')
  local glue_words = request('!.concepts.words.to_string')
  to_string =
    function(me)
      local words = { }
      for _, token in ipairs(me) do
        add_to_list(words, quote(token))
      end
      return glue_words(words)
    end
end

local execute
do
  local execute_shell_command = request('!.concepts.shell.execute')
  execute =
    function(me)
      return execute_shell_command(to_string(me))
    end
end

local interface
local create
do
  local attach_methods = request('!.table.attach_methods')
  create =
    function(me)
      assert_table(me)
      for _, token in ipairs(me) do
        assert_string(token)
      end
      attach_methods(me, interface)
      return me
    end
end

interface =
  {
    create = create,
    to_string = to_string,
    execute = execute,
  }

-- Export:
return interface

--[[
  2026 # # #
  2026-11-11
]]
