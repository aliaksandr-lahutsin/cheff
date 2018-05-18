
class zabbix_agent::packages (
#  $manage_repo    = $zabbix::params::manage_repo,
#  $manage_apt     = $zabbix::params::manage_apt,
#  $repo_location  = $zabbix::params::repo_location,
#  $zabbix_version = $zabbix::params::zabbix_version,
) inherits zabbix::params {

 notify { 'Start install zabbix-agent package':
   }
     package { "zabbix-agent":
       require => Class['zabbix::repo'],
       tag     => 'zabbix',
     }

}

