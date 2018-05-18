## site.pp ##

File { backup => false }

node puppetnode {
  include uptoyou
  include file
  include zabbix
}

node puppetnode2 {
  include zabbix_agent
  include uptoyou
}
