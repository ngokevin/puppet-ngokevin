import "classes/*.pp"

$USER = "ngoke"
$USER_DIR = "/home/ngoke"
$PUPPET_DIR = "/home/ngoke/Code/puppet-ngokevin"

Exec {
    path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

class ngokevin {
    class {
        init: before => Class[apt];
        apt: require => Class[init];
        bash: require => Class[init];
        vim: require => Class[init];
        git: require => Class[init];
        python: require => Class[init];

        wok: require => [Class[git], Class[python]];
        ngokevin: require => Class[wok];
        apache2: require => Class[ngokevin];

        beets: require => [Class[git], Class[python]];
        subsonic: require => Class[apt];
    }
}

include ngokevin
