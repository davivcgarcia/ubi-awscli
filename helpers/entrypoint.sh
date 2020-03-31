#!/bin/bash

#
# Discover user/group used on execution
#

export USER_ID=$(id -u)
export GROUP_ID=$(id -g)

#
# Enables rootless execution
#

grep -v "^${AWSCLI_USER}" /etc/passwd > "${AWSCLI_WORKDIR}/nss_wrapper-passwd"
echo "${AWSCLI_USER}:x:${USER_ID}:${GROUP_ID}:gogs.io user:${AWSCLI_WORKDIR}:/bin/bash" >> "${AWSCLI_WORKDIR}/nss_wrapper-passwd"
export LD_PRELOAD=libnss_wrapper.so
export NSS_WRAPPER_PASSWD=${AWSCLI_WORKDIR}/nss_wrapper-passwd
export NSS_WRAPPER_GROUP=/etc/group

#
# Expose common environment variables
#

export USER=${AWSCLI_USER}
export HOME=${AWSCLI_WORKDIR}
export LANG=en_US.UTF-8

#
# Executes Dockerfile command
#

exec "$@"
exit $?