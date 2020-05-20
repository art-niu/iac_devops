To install the latest sonarqube, please check the prerequisites on https://docs.sonarqube.org/latest/requirements/requirements/

Role Name
=========

sonarqube

Requirements
------------

Database must be ready, user and schema have been created. 
Role Variables
--------------


Dependencies
------------

PostgreSQL is chosen in this scenario, it must be executed first.
Example Playbook
----------------



License
-------

BSD

Author Information
------------------


Other
------------------
If you found sonarqube only listen on ipv6, then disable ipv6 if it is not being used.

How to disable ipv6 on Debina and Ubuntu:

add below lines into /etc/sysctl.conf

	net.ipv6.conf.all.disable_ipv6 = 1
	net.ipv6.conf.default.disable_ipv6 = 1
	net.ipv6.conf.lo.disable_ipv6 = 1 

then reboot your server.
