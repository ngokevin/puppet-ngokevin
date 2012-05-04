exec { "update_apt":
    command => "apt-get update",
    user => root;
}

package { "python-software-properties":
    ensure => present,
    require => [
        Exec["update_apt"],
    ];
}

Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

node core {
  include apt
  include git
  include python
  include ruby
  include vim
}

node base inherits core {
  include bash
  include mosh
  include pil
  include wok
}

node server inherits base {
  include apache2
  include weechat
}

node gui inherits base {
}

node laptop inherits gui {
  include cheese
}

node desktop inherits gui {
}
