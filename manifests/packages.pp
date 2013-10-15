class zoneminder::packages {

  include zoneminder::params

  package {'rpmforge-release':
    ensure   => latest,
    provider => 'rpm',
    source   => 'http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm',
  }

  package {'elrepo-release':
    ensure   => latest,
    provider => 'rpm',
    source   => 'http://elrepo.org/elrepo-release-6-5.el6.elrepo.noarch.rpm',
  }
  package {'epel-release':
    ensure   => latest,
    provider => 'rpm',
    source   => 'http://mirror.pnl.gov/epel/6/i386/epel-release-6-8.noarch.rpm'
  }

  file {'/etc/yum.repos.d/elrepo.repo':
    ensure => file,
    source => 'puppet:///modules/zoneminder/elrepo.repo',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    require => Package['elrepo-release'],
  }
  package { $zoneminder::params::zoneminder_prereq:
    ensure => latest,
    require => Package['rpmforge-release'],
  }

  package {'kernel-ml':
    ensure => latest,
    require => File['/etc/yum.repos.d/elrepo.repo'],
  }

  perl::module { 'X10::ActiveHome': }

}
