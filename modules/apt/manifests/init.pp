class apt {
    cron { "apt-update":
        command => "/usr/bin/apt-get update",
        user => root,
        hour => 3,
        minute => 0;
    }
}
