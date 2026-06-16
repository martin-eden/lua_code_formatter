return
  function(self, representation)
    local result = true

    local text_margin = representation:get_block_width()
    if self.right_margin then
      result = result and (text_margin <= self.right_margin)
    end

    local text_width = representation:get_text_width()
    if self.max_text_width then
      result = result and (text_width <= self.max_text_width)
    end

    return result
  end
