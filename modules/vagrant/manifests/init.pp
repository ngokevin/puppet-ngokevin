class vagrant {

    case $::architecture {
        amd64: { $get_vb =  "wget http://download.virtualbox.org/virtualbox/4.1.14/VirtualBox-4.1.14-77440-Linux_amd64.run" }
        default: { $get_vb = "wget http://download.virtualbox.org/virtualbox/4.1.14/VirtualBox-4.1.14-77440-Linux_x86.run" }
    }

    exec { "virtualbox_download":
        command => $get_vb,
        cwd => "/tmp";
    }

    exec { "virtualbox_install":
        cwd => "/tmp",
        command => "bash VirtualBox-4.1.14*.run",
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

    exec { "create_basebox":
        command => "vagrant basebox define 'ubuntu64' 'ubuntu-11.10-server-amd64'",
        cwd => $USER_DIR;
        user => $USER;
    }

    exec { "get_iso":
        command => "wget http://releases.ubuntu.com/11.10/ubuntu-11.10-server-amd64.iso",
        cwd => $USER_DIR;
        user => $USER;
    }

    exec { "build_basebox":
        command => "vagrant basebox define 'ubuntu' 'ubuntu-11.10-server-amd64'",
        cwd => $USER_DIR;
        user => $USER;
}
