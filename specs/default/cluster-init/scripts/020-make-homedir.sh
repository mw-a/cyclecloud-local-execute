#!/bin/bash

set -e

if [ -n "$(jetpack config pbspro.version "")" ] ; then
	cat <<EOF >/var/spool/pbs/mom_priv/prologue
#!/bin/bash

# trigger creation of user home directory
su - "\$2" -c /bin/true
EOF
	chmod 755 /var/spool/pbs/mom_priv/prologue
fi
