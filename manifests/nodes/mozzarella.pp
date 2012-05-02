$USER = "ngoke"
$USER_DIR = "/home/ngoke"
$PUPPET_DIR = "/home/ngoke/Code/puppet-ngokevin"

$NAME = "Kevin Ngo"
$EMAIL = "ktngo09@gmail.com"

node "mozzarella" inherits laptop {
    include gnome
    include compiz
    include firefox
    include nvidia
    include synapse
    include terminator
    include vagrant
}
