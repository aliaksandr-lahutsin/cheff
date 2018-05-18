
class zabbix::configs (
#  $manage_repo    = $zabbix::params::manage_repo,
#  $manage_apt     = $zabbix::params::manage_apt,
#  $repo_location  = $zabbix::params::repo_location,
#  $zabbix_version = $zabbix::params::zabbix_version,
) inherits zabbix::params {

   notify { 'confidure mysql for zabbix':
   }
   exec { 'init db for zabbix in mysql':
        path    => '/usr/bin:/usr/sbin:/bin',
        command => "zcat /usr/share/doc/zabbix-server-mysql-*/create.sql.gz | mysql -uzabbix -ppassword zabbix"
   }

   notify { 'set configs for zabbix-server':
   }
   exec { 'config file1':
      path    => '/usr/bin:/usr/sbin:/bin',
      command => "sed -i 's/\# DBHost=localhost/DBHost=localhost/' /etc/zabbix/zabbix_server.conf",
     #  onlyif  => "systemctl is-enabled ${server_service_name} | grep enabled >> /dev/null",
  }

  exec { 'config file2':
       path    => '/usr/bin:/usr/sbin:/bin',
       command => "sed -i 's/\# DBPassword=/DBPassword=password/' /etc/zabbix/zabbix_server.conf"
  }

  notify { 'set region for httpd':
   }
  exec { 'config region':
       path    => '/usr/bin:/usr/sbin:/bin',
       command => "sed -i 's/\# php_value date.timezone Europe\/Riga/php_value date.timezone Europe\/Minsk/' /etc/httpd/conf.d/zabbix.conf"
  }

   notify { 'Configure zabbix-agent':
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
