class apache_httpd{
  if $::osfamily == "RedHat" {
    $apache_name = 'httpd'
    $site_name = 'puppet.redhat'
    $conf_loc  = "/etc/httpd/conf.d/$site_name.conf"
  }
  elsif $::osfamily == "Debian" {
    $apache_name = 'apache2'
    $site_name = 'puppet.debian'
    $conf_loc  = "/etc/apache2/conf-enabled/$site_name.conf"

  }

  package { 'httpd':
    ensure => 'installed',
    name   => $apache_name,
    notify => Service[web_srv]
  }

  file {"$conf_loc":
    content => epp('apache_httpd/vhost_content', {'name_site' => $site_name}),
    notify  => Service['web_srv'],
  }


  file {"/var/www/$site_name":
   # content => epp('apache_httpd/index2.html', {'name' => $apache_name}),
    ensure  => directory,
  }

  file {"/var/www/$site_name/index.html":
   content => epp('apache_httpd/index2.html', {'name' => $apache_name}),
  }

  service { 'web_srv':
    ensure => 'running',
    name   => $apache_name,
  }
}
