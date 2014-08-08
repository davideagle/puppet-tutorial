node 'puppet.local' {
  include ::base
  notify { "Generated from our notify branch": }
}
