FROM registry.access.redhat.com/ubi8/ubi-minimal

ENV awscli_release 1.16.292

RUN microdnf install -y python36 && \
    microdnf clean all && \
    pip3 install awscli==$awscli_release

ENTRYPOINT ["/bin/sh"]
