class crontab {

    $CRONTAB = "$PUPPET_DIR/files/etc/crontab"

    file { "crontab":
        path => "/etc/crontab",
        source => "$CRONTAB",
        owner => root, group => root, mode => 644;
    }

}
