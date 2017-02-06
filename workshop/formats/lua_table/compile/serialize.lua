local serializers =
  {
    ['nil'] = request('serializers.nil'),
    boolean = request('serializers.boolean'),
    number = request('serializers.number'),
    string = request('serializers.string'),
    ['function'] = request('serializers.function'),
    userdata = request('serializers.userdata'),
    thread = request('serializers.thread'),
    table = request('serializers.table'),
  }

return
  function(self, node, deep, parent_type)
    deep = deep or self.initial_deep
    serializers[type(node)](self, node, deep, parent_type)
  end
