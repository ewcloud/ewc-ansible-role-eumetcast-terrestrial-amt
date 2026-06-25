# Changelog

All notable changes to this project are documented in this file. See
[Conventional Commits](https://conventionalcommits.org) for commit guidelines.

# [1.2.0](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/compare/1.1.0...1.2.0) (2026-06-25)


### Features

* reenable final check ([#5](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/issues/5)) ([97dfafd](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/97dfafdaf902e068298ebc323cfcfb7d26ebce7c))

# [1.1.0](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/compare/1.0.2...1.1.0) (2026-06-25)


### Features

* allow test user to delete AMT logs via ACL ([#3](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/issues/3)) ([ed8cd34](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/ed8cd340e3ae5793b148dce63ab81f20dceab3c0))

## [1.0.2](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/compare/1.0.1...1.0.2) (2026-06-24)


### Bug Fixes

* missed variable ([a182f08](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/a182f087cb63fccfb4a327f48cf16418663a981c))

## [1.0.1](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/compare/1.0.0...1.0.1) (2026-06-24)


### Bug Fixes

* wrong variables names ([c94f1ad](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/c94f1ad3961acb661a2a7861679e8c20ce296085))

# 1.0.0 (2026-04-17)


### Bug Fixes

* Client config for TER-3 relay missing in AMT 2.0-2 ([c04e33e](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/c04e33e0dd177642751aa208e9caf1cb4bb49efe))


### Features

* Add user input validation ([00d37d8](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/00d37d81b2109b8288acf83e64a33cf39c205c4a))
* Configure networking for AMT stable connectivity ([c9736d4](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/c9736d414d737afd4aba694450a3e9ad0ddbc3f5))
* Configure, enable and start core services ([f359b82](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/f359b821807eeb63dcdf0315544fc68a13e1fef2))
* Designated local linux user to run client applications ([18fc11f](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/18fc11f4ffe9788d703e0103827cd79d2a550f29))
* Install eumetcast core dependencies ([429bdf4](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/429bdf421badff2f00af44e37f50865e1fdc38dd))
* Install general dependencies ([e6aab5f](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/e6aab5f71c2952e289e9b850f684ee748e885718))
* Linux distro check to ensure deployment on Ubuntu 22 only ([43e6c3f](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/43e6c3ff2b67c967c0ba18db86e0aa036c0e1adc))
* List installed package versions ([f8b8d6a](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/f8b8d6a80d6177a798edeec0dcf292b82a20550a))
* Overwrite Tellicast service configuration ([e403f79](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/e403f793697d8174e9416b0012c132ac4b1cdb35))
* Pin packages versions ([cb39331](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/cb393315d1b3e6464c2d1b89c7015d2f1462bdaa))
* Probe for readiness ([dbb490e](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/dbb490e0d5b22aa7e3349743fd733018f9612086))
* Pull eumetcast core dependencies ([b72cddd](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/b72cddd3e60862a3f29ba975a897f07d685465fa))
* Pull latest dependency versions from designated sources ([#1](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/issues/1)) ([22549de](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/22549deae812ee4b268b3f6a6bbd4cea241ce83c))
* Schedule file system cleanup jobs for quality of life ([e9981a0](https://github.com/ewcloud/ewc-ansible-role-eumetcast-terrestrial-amt/commit/e9981a056cafa9c341c7dea4eb87019ee753b863))
