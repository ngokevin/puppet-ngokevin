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
        packages: require => Class[apt];

        bash: require => Class[init];
        vim: require => Class[init];
        git: require => Class[init];
        python: require => Class[init];

        pil: require => Class[python];
        wok: require => [Class[git], Class[python], Class[pil]];
    }
}

include puppet-ngokevin
