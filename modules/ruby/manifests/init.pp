class ruby {
    package { "ruby":
        ensure => installed;
    }

    package { "ruby-dev":
        ensure => installed;
    }

    exec { "rubygems_wget":
        command => "wget http://production.cf.rubygems.org/rubygems/rubygems-1.8.24.tgz",
        cwd => "/tmp",
        user => "$USER";
    }

    exec { "rubygems_extract":
        command => "tar -xzf rubygems-1.8.24.tgz",
        cwd => "/tmp",
        require => [
            Exec["rubygems_wget"],
        ],
        user => root;
    }

    exec {"rubygems_install":
        command => "ruby setup.rb",
        cwd => "/tmp/rubygems-1.8.24",
        require => [
            Exec["rubygems_install"],
        ],
        user => root;
    }
}
