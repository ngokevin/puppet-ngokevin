class wireless {

    package { "network-manager":
        ensure => purged,
        before => Package['network-manager-gnome'];
    }

    package { "network-manager-gnome":
        ensure => purged,
        before => Package['wpasupplicant'];
    }

    file { "interfaces":
        path => "/etc/network/interfaces",
        source => "$PUPPET_DIR/files/etc/network/interfaces",
        owner => "root", group => "root", mode => "0644";
    }

    file { "wpa_supplicant.conf":
        path => "/etc/wpa_supplicant.conf",
        source => "$PUPPET_DIR/files/etc/wpa_supplicant.conf",
        owner => "root", group => "root", mode => "0644";
    }

    package { "wpasupplicant":
        ensure => installed,
        require => [
            File['interfaces'],
            File['wpa_supplicant.conf']
        ];
    }

}
