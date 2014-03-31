class php5::install{
    exec { 'add-php5-oldstable':
        command => '/usr/bin/apt-add-repository ppa:ondrej/php5-oldstable && /usr/bin/apt-get update',
        require => Package['python-software-properties']
    }

    package{"php5":
        ensure => present,
        require => Exec['add-php5-oldstable']
    }
    package{"php5-dev":
        ensure=>present,
        require => Exec['add-php5-oldstable']
    }
    # package{"php5-mysql":
    #     ensure=>present,
    #     require => Exec['add-php5-oldstable']
    # }
    package{"php5-curl":
        ensure=>present,
        require => Exec['add-php5-oldstable']
    }
    package{"php5-gd":
        ensure=>present,
        require => Exec['add-php5-oldstable']
    }
    package{"php5-fpm":
        ensure=>present,
        require => Exec['add-php5-oldstable']
    }
    package{"php5-cli":
        ensure=>present,
        require => Exec['add-php5-oldstable']
    }
    package{"php5-mcrypt":
        ensure=>present,
        require => Exec['add-php5-oldstable']
    }
    package{"libapache2-mod-php5":
        ensure=>present,
        require => Exec['add-php5-oldstable']
    }
}
