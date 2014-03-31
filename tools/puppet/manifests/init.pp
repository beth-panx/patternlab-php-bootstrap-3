exec { "apt-get update":
  command => "apt-get update",
  path    => "/usr/bin"
}

class{'apache2::install':}
class{'php5::install':}