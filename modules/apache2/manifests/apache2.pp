class apache2 {

    case $operatingsystem {
        debian, ubuntu: {
            package { "apache2-dev":
                ensure => present,
                before => File["ngokevin.conf"];
            }

            file { "ngokevin.conf":
                path => "/etc/apache2/sites-enabled/ngokevin.conf",
                source => "$PUPPET_DIR/files/etc/apache2/sites-enabled/ngokevin.conf",
                owner => "root", group => "root", mode => 0644,
                require => Package['apache2-dev'];
            }

            file { "/etc/apache2/sites-available/default":
                ensure => absent;
            }
            file { "/etc/apache2/sites-available/default-ssl":
                ensure => absent;
            }
            file { "/etc/apache2/sites-enabled/000-default":
                ensure => absent,
                require => [
                    File['/etc/apache2/sites-available/default'],
                    File['/etc/apache2/sites-available/default-ssl']
                ];
            }

            exec {
                'a2enmod rewrite':
                onlyif => 'test ! -e /etc/apache2/mods-enabled/rewrite.load';
                'a2enmod proxy':
                onlyif => 'test ! -e /etc/apache2/mods-enabled/proxy.load';
                'a2enmod userdir':
                onlyif => 'test ! -e /etc/apache2/mods-enabled/userdir.load';
            }

            service { "apache2":
                ensure => running,
                enable => true,
                require => Package['apache2-dev'],
                subscribe => [
                    File['ngokevin.conf'],
                    File['/etc/apache2/sites-enabled/000-default'],
                ];
            }
        }
    }

}
