class zabbix_agent {
    
    $something = $::operatingsystemmajrelease

#   include '::mysql::server'

#   mysql::db { 'zabbix':
#     user     =>  'zabbix',
#     password =>  'password',
#     host     =>  'localhost',
#     grant    => ['ALL'],
#   }

#   class { '::role::zabbix_role':
#   }
   
#   role::zabbix_role

   class { '::zabbix::repo':
      zabbix_version => $zabbix_version,
      manage_repo    => $manage_repo,
   }

   notify { 'Notification to the clients':
}

   

   class { '::zabbix_agent::packages':
   }

   class { '::zabbix_agent::configs':
   }

   class { '::zabbix_agent::services':
   }

   class { '::zabbix_agent::python3':
   }

}

