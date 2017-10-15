# Class: rvim
# ===========================
#
# Full description of class rvim here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'rvim':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class rvim (
  Boolean $set_nocompatible,
  Boolean $syntax,
  Array $default_vim_folders,
  Array $userpaths,
) {
  $userpaths.each | String $path| {
    rvim::config { $path:
      userhome    => $path,
      vimfolders => $default_vim_folders,
    }
  }

}


# vim: ai ts=2 sts=2 et sw=2 ft=puppet
# vim: autoindent tabstop=2 shiftwidth=2 expandtab softtabstop=2 filetype=puppet
