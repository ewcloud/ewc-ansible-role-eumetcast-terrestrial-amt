# EUMETCast Terrestrial AMT Ansible Role

This repository contains a configuration template
(i.e. an [Ansible Role](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html))
to customize your environment in the
[European Weather Cloud (EWC)](https://europeanweather.cloud/).

The template is designed to:

* Configure pre-existing virtual machines such that they:

  * Install and configure the [EUMETCast Terrestrial](https://user.eumetsat.int/data-access/eumetcast-terrestrial) client over Automatic Multicast Tunnelling (AMT)
  * Deploy the Tellicast terrestrial receiver runtime
  * Configure network translation required for multicast reception over AMT
  * Create maintenance jobs for log and data retention

EUMETCast Terrestrial over AMT can serve any user hosted on a cloud, from AWS to the EWC, regardless of native multicast connectivity. The encapsulated data can travel via GEANT network or the commercial internet.
The resulting download of the data stream is kept in your target host, under the `/home/eumetuser/data` subdirectory.


## Copyright and License
💡 The Tellicast client license credentials must be supplied externally at deployment time.

See the [LICENSE](./LICENSE) file for licensing information as it pertains to files in this repository.


## Infrastructure Requirements

Recommended target virtual machine profile:

| Resource | Recommended                                |
| -------- | ------------------------------------------ |
| OS       | Ubuntu 22.04                               |
| CPU      | 8 vCPU minimum                             |
| RAM      | 64 GB                                      |
| Storage  | 1 TB+                                      |
| Network  | Private network with outbound connectivity |
| Security Group | UDP 2268 allowed                           |



## Usage

The steps below assume your local file system follows the example structure below, with `ewc-ansible-role-eumetcast-terrestrial-amt` being a clone of this repository:

```text
.
├── roles
│   └── ewc-ansible-role-eumetcast-terrestrial-amt
├── inventory.yml
└── playbook.yml
```

### 1. Specify the target host and SSH credentials

Create an inventory file to specify the address and credentials that Ansible should use to reach the virtual machine you wish to configure:

```yaml
# inventory.yml
---
ewcloud:
  hosts:
    eumetcast_amt:
      ansible_python_interpreter: /usr/bin/python3
      ansible_host: <add the IPv4 address of the target host>
      ansible_ssh_private_key_file: <add the path to local SSH RSA private key file>
      ansible_user: <add the username which owns the SSH RSA private key>
```


### 2. Customize the template

Edit input values for the template variables as needed (see [Inputs](#inputs) section for details).
Then, proceed to create an Ansible Playbook file to load your customizations:


```yaml
# playbook.yml
---
- name: EUMETCast AMT Library Item Automation Script
  hosts: eumetcast_amt
  become: true
  become_user: root
  become_method: ansible.builtin.sudo

  roles:
    - ewc-ansible-role-eumetcast-terrestrial-amt
```

# 3. Apply the template

You can apply changes on the target host by running:

```bash
ansible-playbook -i inventory.yml playbook.yml
```

# Inputs

| Name                        | Description                                          | Type     | Default           | Required |
| --------------------------- | ---------------------------------------------------- | -------- | ----------------- | :------: |
| tellicast_license_user_name | Tellicast license user identifier                    | `string` | n/a               |    yes   |
| tellicast_license_user_key  | Tellicast license activation key                     | `string` | n/a               |    yes   |

# Final Environment

Applying this template will configure the target host with the following major runtime components:

| Name | Version | License | Package Info |
|------|---------|---------|--------------|
| libc6:i386                   | 2.35 | GPL-3 | https://packages.debian.org/sid/i386/libc6/download |
| libncurses5:i386             | 6.3 | GPL-3 | https://packages.debian.org/bullseye/i386/libncurses5/download |
| libstdc++6:i386              | 2.35 | GPL-3 | https://packages.debian.org/sid/i386/libstdc++6/download  |
| netfilter-persistent         | 1.0  | GPL-3 | https://packages.debian.org/bullseye/netfilter-persistent  |
| amt                          | 2.0  |  BSD 3-Clause "New" or "Revised" | https://gitlab.eumetsat.int/open-source/amt |
| Tellicast terrestrial client | 2.14  | The TelliCast Client software is proprietary software developed by ST-Engineering/iDirect for use with EUMETSAT's near-real-time data dissemination system, EUMETCast. As per contract EUM/CO/13/4600001246/LW, rider 13, EUMETSAT is authorized to distribute the binary software to users of the EUMETCast system, in accordance with the number of licenses procured from the service provider. No source code is provided. Please note: A) Users can download the software freely; however, access to the EUMETCast service itself requires registration via EUMETSAT's User Portal, and B) The software is only operational when used with valid EUMETCast credentials issued by the EUMETSAT Helpdesk. | https://sftp.eumetsat.int/public/folder/uscvknvooksycdgpmimjnq/User-Materials/EUMETCast_Support/EUMETCast_Licence_cd/Linux/Tellicast/ |



# Changelog

All notable changes (i.e. fixes, features and breaking changes) are documented in the [CHANGELOG.md](./CHANGELOG.md).

# Contributing

Thanks for taking the time to contribute.

Please make sure to:

* Familiarize yourself with our [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md)
* See [CONTRIBUTING.md](./CONTRIBUTING.md) for contribution instructions

# Authors

European Weather Cloud
[support@europeanweather.cloud](mailto:support@europeanweather.cloud)
