puppet-softec\_nfs
=================

wrapper of puppet-nfs module with use of monit and default mount options

####Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options and additional functionality](#usage)
3. [Setup Requirements](#setup-requirements)
4. [Default config options](#default-config-options)

##Overview
Actually module only contain define softec\_nfs::mount as wrapper  of nfs::mount. Two optional parameter are present for managing monitoring by monit.

##Usage
To enable monit monitoring

    softec_nfs::mount { '/path/to/mountpoint':
      server          => 'nfs.server',
      share           => "/share/name/on/nfs/server",
      monit           => true,
    }

Use parameter monit\_action to override default action

##Setup Requirements
This module depends on softecspa/puppet-nfs

##Default config options
By default:

 * **monit**         => true
 * **monit\_action** => /usr/local/sbin/puppet-run -f1 -c
 * **client_options**=> $::nfs\_mount\_options
