# This Puppetfile generates a working Quartermaster for generating all necessary images.
#
# Git Settings
git_protocol=ENV['git_protocol'] || 'git'
base_url = "#{git_protocol}://github.com"

# 
branch_name = 'origin/grizzly'

#mod 'manifests', :git => "#{base_url}/openstack-hyper-v/puppet-manifests"

# PuppetLabs
mod 'puppetlabs/mysql', :git => "#{base_url}/puppetlabs/puppetlabs-mysql", :ref => 'master'
mod 'puppetlabs/firewall', :git => "#{base_url}/puppetlabs/puppetlabs-firewall", :ref => 'master'
mod 'puppetlabs/ntp', :git => "#{base_url}/puppetlabs/puppetlabs-ntp", :ref => 'master'
mod 'puppetlabs/apache', :git => "#{base_url}/puppetlabs/puppetlabs-apache", :ref => 'master'
mod 'puppetlabs/stdlib', :git => "#{base_url}/puppetlabs/puppetlabs-stdlib", :ref => 'master'
mod 'puppetlabs/apt', :git => "#{base_url}/puppetlabs/puppetlabs-apt", :ref => 'master'
mod 'puppetlabs/vcsrepo', :git => "#{base_url}/puppetlabs/puppetlabs-vcsrepo", :ref => 'master'
mod 'puppetlabs/mount_providers', :git => "#{base_url}/puppetlabs/puppetlabs-mount_providers", :ref => 'master'

# upstream is ripienaar
mod 'ripienaar/concat', :git => "#{base_url}/ripienaar/puppet-concat", :ref => 'master'

# upstream is cprice-puppet/puppetlabs-inifile
mod 'cprice404/inifile', :git => "#{base_url}/cprice-puppet/puppetlabs-inifile"
mod 'example42/perl', :git => "#{base_url}/example42/puppet-perl"
