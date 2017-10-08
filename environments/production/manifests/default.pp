package {['ruby-build', 'git', 'vim', 'puppetserver']:
    ensure => installed,
}

file {'/etc/puppetlabs/code/environments':
    ensure  => link,
    force   => true,
    target  => '/vagrant/environments',
    require => Package['puppetserver'],
}

service{'puppetserver':
    ensure  => 'running',
    require => Package['puppetserver'],
}
