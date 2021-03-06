class puppet_metadata_service::puppetserver {

  file { '/etc/puppetlabs/puppet/get-nodedata.rb':
    ensure => file,
    owner  => 'pe-puppet',
    group  => 'pe-puppet',
    mode   => '0755',
    source => 'puppet:///modules/puppet_metadata_service/get-nodedata.rb',
  }

  file { '/etc/puppetlabs/puppet/puppet-metadata-service.yaml':
    ensure  => file,
    owner   => 'pe-puppet',
    group   => 'pe-puppet',
    mode    => '0640',
    content => epp('puppet_metadata_service/puppet-metadata-service.yaml.epp', {

    }),
  }

  # TODO: ini_setting for puppet.conf to use it

}
