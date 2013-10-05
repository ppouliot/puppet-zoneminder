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

  package {'kmod-r8168':
    ensure => latest,
  }

}
