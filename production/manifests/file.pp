class file {
  file { "/etc/hosts": before => Class["uptoyou"] }
}
