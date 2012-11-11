import "classes/*.pp"

$USER = "osuaiaa"
$USER_DIR = "/home/osuaiaa"
$PUPPET_DIR = "/home/osuaiaa/puppet-ngokevin"

$NAME = "OSU AIAA"
$EMAIL = "oregonstateaiaa@gmail.com"

Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

class puppet-ngokevin {
    class {
        init: before => Class[apt];
        apt: require => Class[init];
        packages: require => Class[apt];

        bash: require => Class[init];
        vim: require => Class[init];
        git: require => Class[init];
        python: require => Class[init];
        tzdata: require => Class[init];

        pil: require => Class[python];
        wok: require => [Class[git], Class[python], Class[pil]];
        ngokevin: require => Class[wok];
        apache2: require => Class[ngokevin];
    }
}

include puppet-ngokevin
