# == Class: zoneminder
#
# Full description of class zoneminder here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { zoneminder:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class zoneminder {

  include zoneminder::params

  class{'ntp':
    servers => ['bonehed.lcs.mit.edu'],
  }

  class{'apache':
    default_vhost  => true,
    mpm_module     => prefork,
    service_enable => true,
    service_ensure => running,
  }
  class {'apache::mod::php':}

  class{'zoneminder::packages':}
  class{'zoneminder::zm':}
#  class{'zoneminder::www':}
  class{'zoneminder::db':}
  class{'zoneminder::build':}

}

Class['zoneminder::packages']   -> 
  Class['zoneminder::zm']        ->
#    Class['zoneminder::www']       ->
      Class['zoneminder::db']       ->
        Class['zoneminder::build']  #->

