return
  function(self)
    if (self.text == '') then
      return ''
    else
      return self.indents_obj.indents[self.indent] .. self.text
    end
  end
