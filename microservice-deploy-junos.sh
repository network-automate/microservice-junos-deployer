#!/bin/sh

cd /
echo "Deploy configuration to Junos devices"

echo "  > Check inventory file"
if [ -f "inventory/inventory.ini" ]
then
	echo "  > Inventory file found (inputs/inventory.ini)"
	echo "  > Deploy configurations to devices"
	ansible-playbook pb.junos.deployer.yml -i inventory/inventory.ini
else
	echo "  ! No inventory file found, aborting"
fi