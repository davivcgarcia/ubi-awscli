#
# Redistributable base image from Red Hat based on RHEL 8
#

FROM registry.access.redhat.com/ubi8/ubi

#
# Metadata information
#

LABEL name="AWS CLI UBI Image" \
      vendor="AWS" \
      maintainer="Davi Garcia <davivcgarcia@gmail.com>" \
      build-date="2022-09-28" \
      version="${AWSCLI_VERSION}" \
      release="1"

#
# Environment variables used for build/exec
#

ENV AWSCLI_VERSION=1.25.83 \
    AWSCLI_USER=awscli \
    AWSCLI_WORKDIR=/home/awscli \
    YUM_OPTS="--setopt=install_weak_deps=False --setopt=tsflags=nodocs" \
    PIP_OPTS="--force-reinstall --no-cache-dir"

#
# Copy helper scripts to image
#

COPY helpers/* /usr/bin/

#
# Install requirements and application
#

RUN yum install ${YUM_OPTS} -y python36 nss_wrapper && \
    yum -y clean all && \
    pip3 install ${PIP_OPTS} awscli==${AWSCLI_VERSION}

#
# Prepare the image for running on OpenShift
#

RUN useradd -m -g 0 ${AWSCLI_USER} && \
    chgrp -R 0 ${AWSCLI_WORKDIR} && \
    chmod -R g+rwX ${AWSCLI_WORKDIR}

USER ${AWSCLI_USER}

#
# Set application execution parameters
#

WORKDIR ${AWSCLI_WORKDIR}

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD [ "/bin/bash" ]
