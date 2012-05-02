class init {
    exec { "update_apt":
        command => "sudo apt-get update",
    }

    package { "python-software-properties":
        ensure => present,
        require => [
            Exec["update_apt"],
        ];
    }
}

