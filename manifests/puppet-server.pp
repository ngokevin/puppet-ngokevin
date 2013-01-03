import "puppet-ngokevin.pp"

class puppet-headless {
    include wireless
    class {
        tzdata: require => Class[init];
        ngokevin: require => Class[wok];
        subsonic: require => Class[apt];
    }
}

include puppet-headless
