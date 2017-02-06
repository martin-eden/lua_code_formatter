return
  {
    init = request('init'),
    match = request('match'),

    handlers = request('handlers.interface'),
    on_match = request('on_match'),
    stream = nil,
  }
