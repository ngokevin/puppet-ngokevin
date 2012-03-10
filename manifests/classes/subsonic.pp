class subsonic {

    package { "openjdk-6-jre":
        ensure => installed,
    }

    package { "subsonic":
        ensure => installed,
        require => [
            Package["openjdk-6-jre"]
        ];
    }

    service { "subsonic":
        ensure => running,
        require => [
            Package['subsonic']
        ],
    }

}
