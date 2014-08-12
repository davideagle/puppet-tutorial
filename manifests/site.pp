node 'puppet.local' {
  include ::base

  include ::puppetdb
  include ::puppetdb::master::config

  # Hiera
  package { ['hiera', 'hiera-puppet']:
    ensure => present,
  }

  notify { "Generated from our notify branch": }
}


