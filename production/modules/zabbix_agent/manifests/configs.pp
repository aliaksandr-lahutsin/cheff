
class zabbix_agent::configs (
#  $manage_repo    = $zabbix::params::manage_repo,
#  $manage_apt     = $zabbix::params::manage_apt,
#  $repo_location  = $zabbix::params::repo_location,
#  $zabbix_version = $zabbix::params::zabbix_version,
) inherits zabbix::params {


   notify { 'Configure zabbix-agent':
   }

   exec { 'post occuring 0':
        path    => '/usr/bin:/usr/sbin:/bin',
        command => "sed -i 's/\Server=127.0.0.1/Server=192.168.56.20/' /etc/zabbix/zabbix_agentd.conf"
   }   

   exec { 'post occuring 1':
        path    => '/usr/bin:/usr/sbin:/bin',
        command => "sed -i 's/\# DebugLevel=3/DebugLevel=3/' /etc/zabbix/zabbix_agentd.conf"
   }

   exec { 'post occuring 2':
      path    => '/usr/bin:/usr/sbin:/bin',
      command => "sed -i 's/\# ListenPort=10050/ListenPort=10050/' /etc/zabbix/zabbix_agentd.conf",
    #  onlyif  => "systemctl is-enabled ${server_service_name} | grep enabled >> /dev/null",
  }

  exec { 'post occuring 3':
       path    => '/usr/bin:/usr/sbin:/bin',
       command => "sed -i 's/\# ListenIP=0.0.0.0/ListenIP=0.0.0.0/' /etc/zabbix/zabbix_agentd.conf",
  }

 exec { 'post occuring 4':
        path    => '/usr/bin:/usr/sbin:/bin',
        command => "sed -i 's/\# StartAgents=3/StartAgents=3/' /etc/zabbix/zabbix_agentd.conf",
   }

}
