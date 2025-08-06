Rustdesk Server
=========

Rustdesk server role for ansible

Requirements
------------

Ports:  
```
tcp 21115, 21116, 21117, 21118, 21119  
udp 21116
```

Role Variables
--------------

``` rustdesk_version ``` — contains rustdesk-server version to be installed

Dependencies
------------

None

Example Playbook
----------------

```yaml
roles:
    - role: genlab.rustdesk_server
```

License
-------

BSD

Author Information
------------------

malyuk.ss@genlab.llc
