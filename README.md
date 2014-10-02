CiInfrastructureCfCli
=====================
[![Build Status](https://travis-ci.org/bonzofenix/ci_infrastructure_cf_cli.svg)](https://travis-ci.org/bonzofenix/ci_infrastructure_cf_cli)
[![Code Climate](https://codeclimate.com/github/bonzofenix/ci_infrastructure_cf_cli.png)](https://codeclimate.com/github/bonzofenix/ci_infrastructure_cf_cli)
[![Coverage Status](https://coveralls.io/repos/bonzofenix/ci_infrastructure_cf_cli/badge.png)](https://coveralls.io/r/bonzofenix/ci_infrastructure_cf_cli)
[![Dependency Status](https://gemnasium.com/bonzofenix/ci_infrastructure_cf_cli.svg)](https://gemnasium.com/bonzofenix/ci_infrastructure_cf_cli)

Command line application for managing your ci_infrastructure_cf.
 Provides tools for customizing deployments and provisioning your jenkins machine with the changes.}

## Installation


    $ gem install ci_infrastructure_cf_cli

## Usage

```:bash
  |2.1.2| Alans-Macbook-Pro in ~/workspace/ci_infrastructure_cf_cli
  ± am |master ✓| → be cic
  Commands:
    cic edit_stub <NAME>      # Edits bosh or cloudfoundry stub for any custom change (eg: number of instances, PEMs, etc)
    cic generate_stub <NAME>  # Interactively generates a bosh or cloudfoundry that lets you generate a full deployment manifest with spiff
    cic help [COMMAND]        # Describe available commands or one specific command
    cic provision             # Provision ci_infrastructure_cf jenkins machine
```


## Contributing

1. Fork it ( https://github.com/bonzofenix/ci_infrastructure_cf_cli/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
