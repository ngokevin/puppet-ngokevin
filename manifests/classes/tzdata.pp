class tzdata {

    package { "tzdata":
        ensure => installed;
    }

    file { "localtime":
        path => "/etc/localtime",
        require => Package["tzdata"],
        source => "file:///usr/share/zoneinfo/US/Pacific";
    }

    file { "timezone":
        path => "/etc/timezone",
        content => "US/Pacific\n";
    }

}
