class vagrant {

    exec { "virtualbox_download":
        command => "wget http://download.virtualbox.org/virtualbox/4.1.14/VirtualBox-4.1.14-77440-Linux_x86.run" }
        cwd => "/tmp";
    }

    exec { "virtualbox_install":
        cwd => "/tmp",
        command => "bash VirtualBox-4.1.14*.run",
        require => [
            Exec["virtualbox_download"],
        ],
        user => root;
    }

    exec { "vagrant":
        command => "gem install vagrant -v '= 0.8.10'",
        user => root;
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

    exec { "get_iso":
        command => "wget http://releases.ubuntu.com/11.10/ubuntu-11.10-server-i386.iso";
        cwd => $USER_DIR,
        user => $USER,
        timeout => 0,
    }

    exec { "create_basebox":
        command => "vagrant basebox define 'ubuntui386' 'ubuntu-11.10-server-i386'",
        cwd => $USER_DIR,
        require => [
            Exec["get_iso"],
        ],
        user => $USER;
    }

    exec { "build_basebox":
        command => "vagrant basebox build 'ubuntui386'"
        cwd => $USER_DIR,
        require => [
            Exec["create_basebox"],
        ],
        user => $USER;
    }
}
