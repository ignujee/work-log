Freedom Box
===========

- A readymade personal server aimed for non-experts. Is a control panel to install many useful social applications.

Installation
------------
     sudo apt-get update
     clear
     sudo DEBIAN_FRONTEND=noninteractive apt-get install freedombox
     sudo apt install openvpn
   
     cat /var/lib/plinth/firstboot-wizard-secret; echo "\n" 
     hostname -d
     cat /etc/hosts
     hostnamectl
     sudo hostnamectl set-hostname sonnet.freedombox.in
     sudo emacs /etc/hosts

and add the following contents

127.0.0.1	localhost
127.0.1.1       debian-sonnet.sonnet.freedombox.in debian-sonnet

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
