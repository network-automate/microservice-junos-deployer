/Scripting/temp/evpn-microservice ᐅ ls
inputs  outputs
~/Scripting/temp/evpn-microservice ᐅ ls inputs
inventory.ini topology.xlsx
~/Scripting/temp/evpn-microservice ᐅ docker run -it --rm -v ${PWD}/inputs:/inventory -v ${PWD}/outputs:/config deployer:latest
Deploy configuration to Junos devices
  > Check inventory file
  > Inventory file found (inputs/inventory.ini)
  > Deploy configurations to devices

PLAY [configure] *******************************************************************************************************************************************************************************************

TASK [include_vars] ****************************************************************************************************************************************************************************************
ok: [demo-qfx10k2-14]
ok: [demo-qfx10k2-15]
ok: [demo-qfx5110-9]
ok: [demo-qfx5110-11]
ok: [demo-qfx5110-10]
ok: [demo-qfx5110-12]

TASK [config-deploy-core : Apply config using native ansible module] ***************************************************************************************************************************************
changed: [demo-qfx10k2-14]
changed: [demo-qfx5110-11]
changed: [demo-qfx5110-9]
changed: [demo-qfx5110-10]
changed: [demo-qfx10k2-15]
changed: [demo-qfx5110-12]

PLAY RECAP *************************************************************************************************************************************************************************************************
demo-qfx10k2-14            : ok=2    changed=1    unreachable=0    failed=0
demo-qfx10k2-15            : ok=2    changed=1    unreachable=0    failed=0
demo-qfx5110-10            : ok=2    changed=1    unreachable=0    failed=0
demo-qfx5110-11            : ok=2    changed=1    unreachable=0    failed=0
demo-qfx5110-12            : ok=2    changed=1    unreachable=0    failed=0
demo-qfx5110-9             : ok=2    changed=1    unreachable=0    failed=0