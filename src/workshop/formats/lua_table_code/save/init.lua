return
  function(self)
    self.table_serializer = new(self.c_table_serializer)
    self.table_serializer:init()
    self.install_node_handlers(
      self.table_serializer.node_handlers,
      self.table_serializer.text_block
    )
  end
