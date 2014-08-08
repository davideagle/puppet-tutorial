# == Class: base
#
# Full description of class base here.
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
#  class { base:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class base {

  include ::ssh

  class { '::ntp':
    servers => [ '0.pool.ntp.org', '2.centos.pool.ntp.org', '1.rhel.pool.ntp.org'],
  }

  $defaultpass = '$6$rI2Wbi03$NzwN27t0DgBIJUC6P4Mgf2kAn2RRYaPVAq9P5ChVJPoNvBN6epgTNyWbfsB45Jeis827\/ZL5U3NS5a9PAJPzT.'
  ::base::user { 'dave':
    state    => 'present',
    id       => 'dave',
    uid      => '507',
    pass     => $defaultpass,
    realname => 'Dave Smith',
    sgroups  => [],
  }

}
