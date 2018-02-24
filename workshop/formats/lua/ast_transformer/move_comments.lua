--[=[

(statements)
|   (call_assign)
|   |   (var_link)
|   |   |   (name)
|   |   |   |   (whitespace)
|   |   |   |   |   (comment)
|   |   |   |   |   |   '--[[ Internal Tables ]]'
|   |   |   |   (whitespace)
|   |   |   |   |   (comment)
|   |   |   |   |   |   '--'
|   |   |   |   (whitespace)
|   |   |   |   |   '\x0D\x0A'
|   |   |   |   'qcCompletedQuests'

=>

(statements)
|   (comment)
|   |   '--[[ Internal Tables ]]'
|   (comment)
|   |   '--'
|   (call_assign)
|   |   (var_link)
|   |   |   (name)
|   |   |   |   (whitespace)
|   |   |   |   (whitespace)
|   |   |   |   (whitespace)
|   |   |   |   |   '\x0D\x0A'
|   |   |   |   'qcCompletedQuests'
]=]

local move_comments
move_comments =
  function(node, parent, insertion_point)
    if not is_table(node) then
      return
    end
    if (node.type == 'comment') then
      table.insert(parent, insertion_point, node)
      return
    end
    if (node.type == 'statements') then
      for i = #node, 1, -1 do
        move_comments(node[i], node, i)
      end
    else
      for i = #node, 1, -1 do
        move_comments(node[i], parent, insertion_point)
      end
    end
  end

return
  function(self)
    move_comments(self.data_struc)
  end
