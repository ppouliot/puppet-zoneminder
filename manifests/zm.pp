# == Class: zoneminder::zm
#
#
class zoneminder::zm {
  vcsrepo{'/usr/local/src/ZoneMinder':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/ZoneMinder/ZoneMinder.git',
  }
  exec {'zm_bootstrap':
    command   => '/usr/local/src/ZoneMinder/bootstrap.sh',
    cwd       => '/usr/local/src/ZoneMinder',
    creates   => '/usr/local/src/ZoneMinder/configure',
    logoutput => true,
    require   => [Vcsrepo['/usr/local/src/ZoneMinder'],Class['zoneminder::packages']],
  }

  service {"zm":
    ensure => running,
    enable => true,
    require => Class['zoneminder::build'],
  }

}
