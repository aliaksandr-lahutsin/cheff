class zabbix_agent::python3 (
#  $manage_repo    = $zabbix::params::manage_repo,
#  $manage_apt     = $zabbix::params::manage_apt,
#  $repo_location  = $zabbix::params::repo_location,
#  $zabbix_version = $zabbix::params::zabbix_version,
) inherits zabbix::params {

 notify { 'Installing python 3.x':
   }
     package { "gcc":
       ensure => installed
     }

    package { "gcc-c++":
       ensure => installed
     }

    package { "make":
       ensure => installed
     }

    package { "git":
       ensure => installed
     }

    package { "patch":
       ensure => installed
     }

    package { "openssl-devel":
       ensure => installed
     }

    package { "zlib-devel":
       ensure => installed
     }

   package { "readline-devel":
       ensure => installed
     }

   package { "sqlite-devel":
       ensure => installed
     }

   package { "python-pip":
      ensure => installed
   }

   file {"/root/zabbix.py":
    content => epp('zabbix_agent/zabbix.py', {'name_site' => $site_name}),
    # notify  => Service['web_srv'],
   } 

  exec { 'pip install requests':
        path    => '/usr/bin:/usr/sbin:/bin',
        command => "pip install requests",
        provider => shell,
   }


   exec { 'python':
        path    => '/usr/bin:/usr/sbin:/bin',
        command => "python /root/zabbix.py",
        provider => shell,
   }



}

