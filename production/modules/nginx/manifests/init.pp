class nginx {
      package { 'nginx':
        ensure => 'installed',
      }
      service { 'nginx':
#        ensure => 'running',
      }

#    service { 'nginx':
#        ensure => 'running',
#      }
}
