#!/bin/sh

Auditctl -e 1
#service enable auditd.service 
nano /etc/audit/aditd.conf

#Insert the following lines
echo "-w /etc/passwd -p wa -k identity" >> /etc/audit/audit.rules
echo "-w /etc/group -p wa -k identity" >> /etc/audit/audit.rules
echo "-w /etc/gshadow -p wa -k identity" >> /etc/audit/audit.rules
echo "-w /etc/shadow -p wa -k identity" >> /etc/audit/audit.rules
echo "-w /etc/security/opasswd -p wa -k identity" >> /etc/audit/audit.rules
echo "-a always,exit -F path=/bin/su -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-priv_change" >> /etc/audit/audit.rules 
echo "-a always,exit -F path=/usr/bin/ssh-agent -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-ssh" >> /etc/audit/audit.rules 
echo "-a always,exit -F arch=b64 -S chown -F auid>=1000 -F auid!=4294967295 -k perm_chng" >> /etc/audit/audit.rules 
echo "-a always,exit -F arch=b64 -S chmod -F auid>=1000 -F auid!=4294967295 -k perm_chng" >> /etc/audit/audit.rules 
echo "-a always,exit -F arch=b64 -S truncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k perm_access" >> /etc/audit/audit.rules
echo "-a always,exit -F arch=b64 -S truncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k perm_access" >> /etc/audit/audit.rules
echo "-a always,exit -F arch=b64 -S creat -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k perm_access" >> /etc/audit/audit.rules
echo "-a always,exit -F arch=b64 -S creat -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k perm_access" >> /etc/audit/audit.rules
echo "-a always,exit -F path=/usr/bin/sudo -F perm=x -F auid>=1000 -F auid!=4294967295 -k priv_cmd" >> /etc/audit/audit.rules
echo "-a always,exit -F path=/usr/bin/sudoedit -F perm=x -F auid>=1000 -F auid!=4294967295 -k priv_cmd" >> /etc/audit/audit.rules
echo "-w /var/log/faillog -p wa -k logins" >> /etc/audit/audit.rules
echo "-w /var/log/lastlog -p wa -k logins" >> /etc/audit/audit.rules
echo "-a always,exit -F path=/usr/bin/passwd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-passwd" >> /etc/audit/audit.rules
echo "-a always,exit -F path=/usr/sbin/usermod -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-usermod" >> /etc/audit/audit.rules
echo "-a always,exit -F path=/usr/bin/chsh -F perm=x -F auid>=1000 -F auid!=4294967295 -k priv_cmd" >> /etc/audit/audit.rules
echo "-a always,exit -F path=/usr/bin/newgrp -F perm=x -F auid>=1000 -F auid!=4294967295 -k priv_cmd" >> /etc/audit/audit.rules
echo "-a always,exit -F path=/sbin/apparmor_parser -F perm=x -F auid>=1000 -F auid!=4294967295 -k perm_chng" >> /etc/audit/audit.rules
echo "-w /var/log/tallylog -p wa -k logins" >> /etc/audit/audit.rules
echo "-w /var/log/faillog -p wa -k logins" >> /etc/audit/audit.rules
echo "-w /var/log/lastlog -p wa -k logins" >> /etc/audit/audit.rules
echo "-a always,exit -F path=/usr/bin/passwd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-passwd" >> /etc/audit/audit.rules
echo "-a always,exit -F path=/usr/bin/gpasswd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-gpasswd" >> /etc/audit/audit.rules
echo "-a always,exit -F path=/usr/bin/chage -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-chage" >> /etc/audit/audit.rules
echo "-a always,exit -F path=/usr/sbin/usermod -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-usermod" >> /etc/audit/audit.rules
echo "-a always,exit -F path=/usr/bin/crontab -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-crontab" >> /etc/audit/audit.rules
echo "-a always,exit -F arch=b64 -S delete_module -F auid>=1000 -F auid!=4294967295 -k module_chng" >> /etc/audit/audit.rules

#service restart auditd.service
exit 0;
