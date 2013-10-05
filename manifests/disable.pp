class zoneminder::disable{

  include zoneminder::params
  include mysql::server

  package {'rpmforge-release':
    ensure   => absent,
    provider => 'rpm',
  }

  package {'elrepo-release':
    ensure   => absent,
    provider => 'rpm',
  }
  package { $zoneminder::params::zm_remove_pkg_1:
    ensure => absent,
  }
  package { $zoneminder::params::zm_remove_pkg_2:
    ensure => absent,
    require => Package[$zoneminder::params::zm_remove_pkg_1],
  }


  package {'kernel-ml':
    ensure => absent,
  }

  package {'kmod-r8168':
    ensure => absent,
  }

  mysql::db { $zoneminder::params::zm_db_name:
    ensure => 'absent',
    user     => $zoneminder::params::zm_db_user,
    password => $zoneminder::params::zm_db_pass,
    host     => $zoneminder::params::zm_db_host,
  }


  vcsrepo{'/usr/local/src/ZoneMinder':
    ensure   => absent,
    provider => git,
  }

  file {'/var/www/html/zm':
   ensure => absent,
  }

  file {['/usr/local/share/perl5/ZoneMinder.pm',
         '/usr/local/share/perl5/ZoneMinder']:
    ensure => absent,
  }


  file {['/usr/local/share/man/man3/ZoneMinder.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Base.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Config.3pm',
         '/usr/local/share/man/man3/ZoneMinder::ConfigAdmin.3pm',
         '/usr/local/share/man/man3/ZoneMinder::ConfigData.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Control.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Control::AxisV2.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Control::FI8608W_Y2k.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Control::FI8620_Y2k.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Control::FI9821W_Y2k.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Control::mjpgStreamer.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Control::Ncs370.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Control::PanasonicIP.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Control::PelcoD.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Control::SkyIPCam7xx.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Control::Visca.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Database.3pm',
         '/usr/local/share/man/man3/ZoneMinder::General.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Logger.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Memory.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Trigger::Channel.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Trigger::Channel::File.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Trigger::Channel::Handle.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Trigger::Channel::Inet.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Trigger::Channel::Serial.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Trigger::Channel::Spawning.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Trigger::Channel::Unix.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Trigger::Connection.3pm',
         '/usr/local/share/man/man3/ZoneMinder::Trigger::Connection::Example.3pm']:
    ensure => absent,
  }
  file {['/usr/local/bin/zma',
         '/usr/local/bin/zmaudit.pl',
         '/usr/local/bin/zmc',
         '/usr/local/bin/zmcontrol.pl',
         '/usr/local/bin/zmdc.pl',
         '/usr/local/bin/zmf',
         '/usr/local/bin/zmfilter.pl',
         '/usr/local/bin/zmfix',
         '/usr/local/bin/zmpkg.pl',
         '/usr/local/bin/zmstreamer',
         '/usr/local/bin/zmtrack.pl',
         '/usr/local/bin/zmtrigger.pl',
         '/usr/local/bin/zmu',
         '/usr/local/bin/zmupdate.pl',
         '/usr/local/bin/zmvideo.pl',
         '/usr/local/bin/zmwatch.pl',
         '/usr/local/bin/zmx10.pl']:
    ensure => absent,
  }

  file {['/usr/local/etc/zm.conf',
         '/etc/init.d/zm']:
    ensure => absent,
  }
}
