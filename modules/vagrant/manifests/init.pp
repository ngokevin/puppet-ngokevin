class vagrant {

    case $::architecture {
        amd64: { $command = "wget http://download.virtualbox.org/virtualbox/4.1.14/VirtualBox-4.1.14-77440-Linux_amd64.run" }
        default: { $command = "wget http://download.virtualbox.org/virtualbox/4.1.14/VirtualBox-4.1.14-77440-Linux_x86.run" }
    }
    exec { "virtualbox_download":
        command => $command,
        cwd => "/tmp";
    }

    exec { "virtualbox_install":
        cwd => "/tmp",
        command => "bash VirtualBox-4.1.14*.run",
        require => [
            Exec["virtualbox_download"],
        ]
        user => root;
    }

    package { "vagrant":
        provider => gem,
        ensure => installed;
    }

    package { "bundler":
        provider => gem,
        ensure => installed;
    }

    package { "veewee":
        provider => gem,
        require => [
            Package["bundler"],
        ],
        ensure => installed;
    }

    case $::architecture {
        amd64: { $command3 = "wget http://releases.ubuntu.com/11.10/ubuntu-11.10-server-amd64.iso" }
        default: { $command3 = "wget http://releases.ubuntu.com/11.10/ubuntu-11.10-server-i386.iso" }
    }
    exec { "get_iso":
        command => $command3,
        cwd => $USER_DIR,
        user => $USER
        timeout => 0,
    }

    case $::architecture {
        amd64: { $command2 = "vagrant basebox define 'ubuntuamd64' 'ubuntu-11.10-server-amd64'" }
        default: { $command2 = "vagrant basebox define 'ubuntui386' 'ubuntu-11.10-server-i386'" }
    }
    exec { "create_basebox":
        command => $command2,
        cwd => $USER_DIR,
        require => [
            Exec["get_iso"],
        ],
        user => $USER;
    }


    case $::architecture {
        amd64: { $command4 = "vagrant basebox build 'ubuntuamd64'" }
        default: { $command4 = "vagrant basebox build 'ubuntui386'" }
    }
    exec { "build_basebox":
        command => $command4,
        cwd => $USER_DIR,
        require => [
            Exec["create_basebox"],
        ],
        user => $USER;
    }
}
