return
  {
    names = {},
    counters =
      {
        ['function'] = 0,
        ['thread'] = 0,
        ['userdata'] = 0,
        ['table'] = 0,
      },
    templates =
      {
        ['function'] = 'f_%d',
        ['thread'] = 'th_%d',
        ['userdata'] = 'u_%d',
        ['table'] = 't_%d',
      },
    give_name =
      function(self, obj)
        if not self.names[obj] then
          local obj_type = type(obj)
          if not self.counters[obj_type] then
            error(
              ('Argument type "%s" not supported for counting.'):
              format(obj_type),
              2
            )
          end
          self.counters[obj_type] = self.counters[obj_type] + 1
          self.names[obj] =
            (self.templates[obj_type]):format(self.counters[obj_type])
        end
        return self.names[obj]
      end,
  }
