node core {
  include git
  include bash
  include python
  include vim
}

node base inherits core {
}

node server inherits base {
}

node gui inherits base {
}

node laptop inherits gui {
}

node desktop inherits gui {
}
