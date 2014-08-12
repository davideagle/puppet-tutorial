node 'puppet.local' {
  include ::base
  include ::puppetdb
  include ::puppetdb::master::config
  notify { "Generated from our notify branch": }
}


