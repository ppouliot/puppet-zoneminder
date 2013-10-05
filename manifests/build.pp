class zoneminder::build {

  include zoneminder::params

  exec {'build_zm':
    environment => ["CXXFLAGS=-DSTDC_CONSTANT_MACROS",
                    "ZM_DB_HOST=${zoneminder::params::zm_db_host}",
                    "ZM_DB_NAME=${zoneminder::params::zm_db_name}",
                    "ZM_DB_USER=${zoneminder::params::zm_db_user}",
                    "ZM_DB_PASS=${zoneminder::params::zm_db_pass}",
                    "ZM_SSL_LIB=openssl"],

#--prefix=${zm_install_prefix} \
    command   => "/bin/bash -C /usr/local/src/ZoneMinder/configure \
--with-webdir=${zoneminder::params::zm_wwwroot} \
--with-cgidir=${zoneminder::params::zm_cgi} \
--with-webuser=${zoneminder::params::zm_webuser} \
--with-webgroup=${zoneminder::params::zm_webgrp} \
--with-extralibs='-L/usr/lib64 \
-L/usr/lib64/mysql'", 

    cwd       => '/usr/local/src/ZoneMinder',
    creates   => '/usr/local/src/ZoneMinder/config.status',
    logoutput => true,
    require   => [Vcsrepo['/usr/local/src/ZoneMinder'],Class['zoneminder::packages']],

  }

  exec {'zm_make':
    command   => '/usr/bin/make',
    cwd       => '/usr/local/src/ZoneMinder',
    require   => Exec['build_zm'],
    logoutput => true,
  }

  exec {'zm_make_install':
    command   => '/usr/bin/make install',
    cwd       => '/usr/local/src/ZoneMinder',
    require   => Exec['zm_make'],
    creates   => '/usr/local/etc/zm.conf',
    logoutput => true,
  }

  file {'/tmp/test.sql':
    ensure  => file,
    content => template("zoneminder/sql.erb"),
    mode    => '0644',
  }
  exec {'zm_populate_db':
    command   => "/usr/bin/mysql -uroot -p${zoneminder::params::zm_db_pass} ${zoneminder::params::zm_db_name} < /usr/local/src/ZoneMinder/db/zm_create.sql", 
    cwd       => '/usr/local/src/ZoneMinder',
    logoutput => true,
    unless    => "/usr/bin/mysql -uroot -p${zoneminder::params::zm_db_pass} </tmp/test.sql", 
    require   => [Exec['zm_make_install'],Class['zoneminder::db']],
  }
  file {'/etc/init.d/zm':
    ensure => file,
    mode   => '0755',
    source => '/usr/local/src/ZoneMinder/scripts/zm',
    require => Exec['zm_make_install'],
  }

  exec {'install_cambozola': 
    command => "/usr/bin/wget -cv ${zoneminder::params::cambozola_url} -O /var/www/html/zm/cambozola.jar", 
    cwd     => '/var/www/html/zm',
    creates => '/var/www/html/zm/cambozola.jar',
    require   => Exec['zm_make_install'],
  }

  file {'/var/www/html/zm/cambozola.jar':
    owner => $zoneminder::params::zm_webuser, 
    group => $zoneminder::params::zm_webgrp,
    mode => '0755',
    require => Exec['install_cambozola'],
  }

  file {'/etc/php.ini':
    ensure => present,
    source => 'puppet:///modules/zoneminder/php.ini',
    require => Class['apache::mod::php'],
    notify => Service['httpd'],
  }
}
