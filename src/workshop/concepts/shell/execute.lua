-- Execute shell command

--[[
  Author: Martin Eden
  Last mod.: 2026-09-14
]]

--[[
  Executes given string as shell command

    Captures termination status, return code, output and errors.

  Input

    [s] command -- shell command to execute

  Output

    [b] true if result code is 0
    [t]
      [i] result_code -- Return code in case of normal ending.
        Termination code (signal number) in case of aborted ending.
      [b] is_aborted -- true in case of aborted execution
      [s] output -- program output
      [s] errors -- program errors
    }
]]

local get_is_aborted =
  function(result_type_code)
    if (result_type_code == 'signal') then
      return true
    elseif (result_type_code == 'exit') then
      return false
    else
      error('Unknown termination status.')
    end
  end

local os_tmpname = os.tmpname
local os_execute = os.execute
local file_to_str = request('!.convert.file_to_str')
local os_remove = os.remove

-- Export:
return
  function(command)
    local output_filename = os_tmpname()
    local error_filename = os_tmpname()

    -- Adds redirects for stdout and stderr
    local shell_command =
      command .. ' ' ..
      '1>' .. output_filename .. ' ' ..
      '2>' .. error_filename

    local _, result_type_code, result_code = os_execute(shell_command)

    local Result =
      {
        result_code = result_code,
        is_aborted = get_is_aborted(result_type_code),
        output = file_to_str(output_filename),
        error = file_to_str(error_filename),
      }

    os_remove(output_filename)
    os_remove(error_filename)

    return (Result.result_code == 0), Result
  end

--[[
  2026 # # #
]]
