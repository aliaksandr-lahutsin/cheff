
class zabbix_agent::services (
#  $manage_repo    = $zabbix::params::manage_repo,
#  $manage_apt     = $zabbix::params::manage_apt,
#  $repo_location  = $zabbix::params::repo_location,
#  $zabbix_version = $zabbix::params::zabbix_version,
) inherits zabbix::params {

  service { 'zabbix-agent':
       ensure => 'running',
  }
}
