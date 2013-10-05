class zoneminder::www {
    apache::vhost {ZoneMinder :
    priority   => '10',
    vhost_name => $::ipaddress,
    port       => 80,
    docroot    => '/var/www/html/',
    logroot    => '/var/log/zm/',
  }
  include  apache::mod::php


}
