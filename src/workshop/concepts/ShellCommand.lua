-- Shell command concept

--[[
  Author: Martin Eden
  Last mod.: 2026-10-14

--[[
  Data format

    1 [s] -- command
    2 [t] -- list of arguments
      0+ [s] argument
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

      local Command = ShellCommand.create({ 'ls', { '-l', '~' } })

    Serializing

      s = Command:ToString()

    Executing

      Command:Execute()
]]

local to_string
do
  local quote = request('!.concepts.shell.quote')
  local add_to_list = request('!.concepts.list.add_item')
  local glue_words = request('!.concepts.words.to_string')
  to_string =
    function(Me)
      local command = Me[1]
      local Args = Me[2]

      local Words = { }
      add_to_list(Words, quote(command))
      for _, arg in ipairs(Args) do
        add_to_list(Words, quote(arg))
      end

      return glue_words(Words)
    end
end

local execute
do
  local execute_shell_command = request('!.concepts.shell.execute')
  execute =
    function(Me)
      return execute_shell_command(to_string(Me))
    end
end

local Interface
do
  local create
  do
    local attach_methods = request('!.table.attach_methods')
    create =
      function(Core)
        -- Check core
        do
          assert_table(Core)
          assert(#Core == 2)

          local command = Core[1]
          local Args = Core[2]

          assert_string(command)
          assert_table(Args)
          for _, arg in ipairs(Args) do
            assert_string(arg)
          end
        end

        attach_methods(Core, Interface)

        return Core
      end
  end

  Interface =
    {
      create = create,
      ToString = to_string,
      Execute = execute,
    }
end

-- Export:
return Interface

--[[
  2026 # # #
]]
