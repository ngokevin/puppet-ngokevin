class firefox {
    package { "firefox":
        ensure  => latest;
    }

    exec { "firefox_nightly_repo":
        command => "add-apt-repository ppa:ubuntu-mozilla-daily/ppa && apt-get update",
        returns => [0, 100],
        user => root;
    }

    package { "firefox-trunk":
        ensure => latest,
        require => Exec["firefox_nightly_repo"];
    }

    file { "vimperatorrc":
        path => "$USER_DIR/.vimperatorrc",
        require => Package["firefox"],
        source => "$PUPPET_DIR/modules/firefox/files/home/vimperatorrc",
        owner => "$USER", group=> "$USER", mode => 644;
    }
}
