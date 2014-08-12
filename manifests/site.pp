node 'puppet.local' {
  include ::base
  include ::puppetdb
  include ::puppet::master::config
  notify { "Generated from our notify branch": }
}


