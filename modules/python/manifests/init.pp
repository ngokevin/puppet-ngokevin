class python {

    package {
        "python2.7": ensure => installed;
        "python2.7-dev": ensure => installed;
        "python-pip": ensure => installed;
        "python-mysqldb": ensure => installed;
        "libapache2-mod-wsgi": ensure => installed;
    }

    exec { "pip":
        command => "pip install -r $PUPPET_DIR/modules/python/pip-packages",
        require => Package["python-pip"],
        timeout => 0,
        user => root;
    }

}
