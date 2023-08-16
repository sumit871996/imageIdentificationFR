FROM image-registry.openshift-image-registry.svc:5000/openshift/nodejs:16-ubi8

LABEL "io.openshift.s2i.build.image"="image-registry.openshift-image-registry.svc:5000/openshift/nodejs:16-ubi8"       "io.openshift.s2i.build.source-location"="."

USER root

COPY upload/src /tmp/src

RUN chown -R 1001:0 /tmp/src

USER 1001

RUN /usr/libexec/s2i/assemble

CMD /usr/libexec/s2i/run
