_List_ is Lua table with integer keys from 1 to N.

Usually short syntax is used for describing list:

  ```
  { 'a', 'b', 'c' }
  ```

  it is same as

  ```
  { [2] = 'b', [1] = 'a', [3] = 'c' }
  ```

There is another very similar concept -- "sequence".

_Sequence_ is a list of values of the list:

  ```
  return 'a', 'b', 'c' -- returns sequence
  return { 'a', 'b', 'c' } -- returns list
  ```

Lists can be memory-long and usually used as arrays.
Sequences are compile-time limited so something like 250
elements and usually used to return multiple results from
function.

2024-10-03
