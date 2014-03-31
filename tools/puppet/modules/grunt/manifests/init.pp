class grunt::install{

  package { 'curl':
    ensure => present,
    require => Exec['apt-get update'],
  }

  package { 'ruby1.9.3':
    ensure => present,
    require => Exec['apt-get update'],
  }

  # Get node
  exec { 'add node repo':
    command => '/usr/bin/apt-add-repository ppa:chris-lea/node.js && /usr/bin/apt-get update',
    require => Package['python-software-properties'],
  }

  package { 'nodejs':
    ensure => latest,
    require => [Exec['apt-get update'], Exec['add node repo']],
  }

  # install npm
  exec { 'npm':
    command => '/bin/sh /project_share/tools/files/etc/grunt/npm-install.sh',
    require => [Package['nodejs']],
    environment => 'clean=yes',
  }

  # install sass
  exec { 'gem install sass':
    command => '/usr/bin/gem install sass',
    require => Package['ruby1.9.3'],
  }

  # create symlink to stop node-modules foler breaking
  exec { 'node-modules symlink':
    command => '/bin/rm -rfv /usr/local/node_modules && /bin/rm -rfv /vagrant/node_modules && /bin/mkdir /usr/local/node_modules && /bin/ln -sf /usr/local/node_modules /vagrant/node_modules ',
  }

  # finally install grunt
  exec { 'npm install -g grunt-cli bower':,
    command => '/usr/bin/npm install -g grunt-cli bower',
    require => Exec['npm'],
  }
}