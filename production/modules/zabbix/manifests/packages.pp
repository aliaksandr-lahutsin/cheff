
class zabbix::packages (
#  $manage_repo    = $zabbix::params::manage_repo,
#  $manage_apt     = $zabbix::params::manage_apt,
#  $repo_location  = $zabbix::params::repo_location,
#  $zabbix_version = $zabbix::params::zabbix_version,
) inherits zabbix::params {

  notify { 'Start install zabbix-server package':
  }
  package { "zabbix-server-mysql":
        #ensure  => zabbix-agent,
        require => Class['zabbix::repo'],
        tag     => 'zabbix',
      }

   notify { 'Start install zabbix-web-mysql package':
   }
     package { "zabbix-web-mysql":
        #ensure  => zabbix-agent,
        require => Class['zabbix::repo'],
        tag     => 'zabbix',
      }

    # also install package zabbix-agent
   notify { 'Start install zabbix-agent package':
   }
     package { "zabbix-agent":
       require => Class['zabbix::repo'],
       tag     => 'zabbix',
     }

}

