class vagrant {
    package { "veewee":
        provider => gem,
        ensure => installed;
    }
}
