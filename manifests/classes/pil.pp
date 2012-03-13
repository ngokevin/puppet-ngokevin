class pil {

    exec { "PIL-dep":
        command => "ln -s /usr/lib/i386-linux-gnu/libz.so /usr/lib/ &&
                    ln -s /usr/lib/i386-linux-gnu/libjpeg.so /usr/lib &&
                    ln -s /usr/lib/i386-linux-gnu/libfreetype.so /usr/lib",
        returns => [0, 1],
        user => root;
    }

    exec { "PIL":
        command => "pip install pil",
        require => Exec["PIL-dep"],
        timeout => 0,
        user => root;
    }
}
