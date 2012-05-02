$USER = "ngoke"
$USER_DIR = "/home/ngoke"
$PUPPET_DIR = "/home/ngoke/Code/puppet-ngokevin"

$NAME = "Kevin Ngo"
$EMAIL = "ktngo09@gmail.com"

node "voodoo" inherits server {
    include tzdata
    include beets
    include subsonic
}
