define rvim::plugins (
  Array $vim_plugins,
  String $userhome,
){
  concat { "$userhome/.vim/configs/plugin_list.vim":
    ensure => present,
  }

  concat::fragment { "$userhome/.vim/configs/plugin-local.vim":
    target  => "$userhome/.vim/configs/plugin_list.vim",
    content => template('rvim/vimrc_plugins.erb'),
    order   => '01'
  }
}
# vim: ai ts=2 sts=2 et sw=2 ft=puppet
# vim: autoindent tabstop=2 shiftwidth=2 expandtab softtabstop=2 filetype=puppet
