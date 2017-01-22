return
  function(self, representation)
    local text_width = representation:get_text_width()
    local result = (text_width <= self.right_margin)
    return result
  end
