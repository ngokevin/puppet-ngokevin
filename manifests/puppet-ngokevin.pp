import "classes/*.pp"

$USER = "ngoke"
$USER_DIR = "/home/ngoke"
$PUPPET_DIR = "/home/ngoke/Code/puppet-ngokevin"

$NAME = "Kevin Ngo"
$EMAIL = "ktngo09@gmail.com"

Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

class puppet-ngokevin {
    class {
        init: before => Class[apt];
        apt: require => Class[init];
        bash: require => Class[init];
        vim: require => Class[init];
        git: require => Class[init];
        python: require => Class[init];
        tzdata: require => Class[init];

        pil: require => Class[python];
        wok: require => [Class[git], Class[python], Class[pil]];
        ngokevin: require => Class[wok];
        apache2: require => Class[ngokevin];

        beets: require => [Class[git], Class[python]];
        subsonic: require => Class[apt];
    }
}

include puppet-ngokevin
