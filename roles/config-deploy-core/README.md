# config-deploy-core 

Role to deploy configuration 

# qualified products

This role has been tested with following products:
- QFX5110 

But it should work with all Junos devices  

# Templates 

This role doesnt use explicit templates.  

# Variables

There is a Jinja pre processing of the tasks defined in YAML.  
```
---
- name: Apply config using native ansible module
  junos_config:
      provider: "{{ credentials.junos }}"
      src: "{{ junos_conf }}"
      update: merge
      src_format: text
      comment: "Applied by Ansible"

```
This role is using variables defined under: 
- ```junos_conf``` 
- ```credentials.junos``` 

The variable ```credentials.junos ``` is located here: 
```
# more group_vars/all/network_authentication.yaml
---
credentials:
  junos:
    host: "{{ ansible_host }}"
    username: "{{ ansible_ssh_user }}"
    ssh_keyfile: "{{ ansible_ssh_private_key }}"
    # passwd: User defined password to use to replace key file
    port: "{{ netconf_port }}"
    timeout: 20
```
The variable ```junos_conf``` is located here: 
```
# more build.yaml
########################################################################
# System variable used to define temporary directory
# please update tmp_dir variable if needed
########################################################################
tmp_dir: /var/tmp
build_dir_root: "{{repo_root}}/config/"
build_dir: "{{build_dir_root}}/{{ inventory_hostname }}/"
save_dir_root: "{{repo_root}}/outputs/"
save_dir: "{{save_dir_root}}/{{inventory_hostname}}"
junos_conf: "{{build_dir_root}}/{{ inventory_hostname }}.conf"
repo_root: "{{inventory_dir}}"
```
# Example Playbook 
```
# more pb.solution.evpn-vxlan.configuration.deploy.yaml
- name: configure
  hosts: [leaf,fabric, spine]
  connection: local
  gather_facts: no

  pre_tasks:
    - include_vars: "{{ playbook_dir }}/build.yaml"

  roles:
    - config-deploy-core


```
# Usage

```
# ansible-playbook pb.solution.evpn-vxlan.configuration.deploy.yaml -i inventory_lab_gsbt.ini 
```

