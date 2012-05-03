class ruby {
    package { "ruby1.9.1":
        ensure => installed;
    }

    package { "ruby1.9.1-dev":
        ensure => installed;
    }
}
