class nvidia {

    file { "nvidia_xorg_conf":
        path => "/etc/X11/xorg.conf",
        source => "$PUPPET_DIR/modules/nvidia/files/etc/X11/xorg.cnf",
        owner => root, group => root, mode => 644;
    }

}
