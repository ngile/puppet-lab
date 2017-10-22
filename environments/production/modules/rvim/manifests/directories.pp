define rvim::directories (
  String $userhome,
  Array $vimfolders,
) {
  file { $userhome:
    ensure => 'directory',
  }

  $vimfolders.each | String $folder | {
    file { "$userhome/$folder":
      ensure  => 'directory',
      require => File[$userhome],
    }
  }

}


# vim: ai ts=2 sts=2 et sw=2 ft=puppet
# vim: autoindent tabstop=2 shiftwidth=2 expandtab softtabstop=2 filetype=puppet
