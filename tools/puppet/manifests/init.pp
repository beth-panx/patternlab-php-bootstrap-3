exec { "apt-get update":
  command => "apt-get update",
  path    => "/usr/bin"
}

package { 'python-software-properties':
    ensure => present,
    require => Exec['apt-get update'],
}

class{'apache2::install':}
class{'php5::install':}
class{'grunt::install':}