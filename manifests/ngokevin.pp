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
        apt: before => Class[bash];
        bash: before => Class[vim];
        vim: ;
    }
}

include ngokevin
