class test_mysql {
  include '::mysql::server'

  mysql::db { 'zabbix':
    user     =>  'zabbix',
    password =>  'password',
    host     =>  'localhost',
    grant    => ['ALL'],
  }
}
