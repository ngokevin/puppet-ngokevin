class subsonic {

    package { "openjdk-6-jre":
        ensure => installed,
    }

    exec { "subsonic_download":
        command => "wget http://downloads.sourceforge.net/project/subsonic/subsonic/4.7/subsonic-4.7.deb",
        require => Package["openjdk-6-jre"],
        unless => "cat /etc/default/subsonic > /dev/null";
    }

    exec { "subsonic_install":
        command => "dpkg -i subsonic-4.7.deb",
        require => Exec["subsonic_download"],
        unless => "cat /etc/default/subsonic > /dev/null";
    }

    exec { "subsonic_remove":
        command => "rm -r subsonic-4.7.deb",
        require => Exec["subsonic_install"],
        unless => "cat /etc/default/subsonic > /dev/null";
    }

    service { "subsonic":
        ensure => running,
        require => [
            Exec['subsonic_install']
        ];
    }

}
