if versioncmp($::puppetversion,'3.6.1') >= 0 {

  $allow_virtual_packages = hiera('allow_virtual_packages',false)

  Package {
    allow_virtual => $allow_virtual_packages,
  }
}

node /dhcp/ {
  include ::profile::dhcp_server

  ::dhcp::server::subnet { '10.0.0.0':
    broadcast   => '10.0.0.255',
    netmask     => '255.255.255.0',
    routers     => '10.0.0.1',
    range_begin => '10.0.0.100',
    range_end   => '10.0.0.150',
    dns_servers => ['10.0.0.1', '10.0.0.2'],
    domain_name => 'local',
    other_opts  => ['option ntp-servers 10.0.0.1'],
  }
}

node default {
  hiera_include('classes')
}


