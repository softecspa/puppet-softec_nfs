define softec_nfs::mount (
  $server,
  $share,
  $client_options   = $::nfs_mount_options,
  $mountpoint       = '',
  $ensure           = present,
  $monit            = false,
  $monit_action     = '/usr/local/sbin/puppet-run -f1 -c',
) {

  $real_mountpoint = $mountpoint? {
    ''      => $name,
    default => $mountpoint,
  }

  nfs::mount {$name:
    ensure          => $ensure,
    server          => $server,
    share           => $share,
    mountpoint      => $mountpoint,
    client_options  => $client_options,
  }

  if $monit {

    if $monit_action == '' {
      fail('if monit = true, you must specify a monit_action')
    }

    monit::nfs_mount { $name :
      mountpoint  => $real_mountpoint,
      action      => $monit_action,
    }
  }

}
