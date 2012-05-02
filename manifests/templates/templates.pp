node core {
  include apt
  include bash
  include git
  include mosh
  include pil
  include python
  include weechat
  include wok
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
