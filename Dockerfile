FROM centos:7

ENV RIOFS_VERSION cbe3847f9406de24db6f619a775df0b06422c219

WORKDIR /

RUN mkdir -p riofs && curl -sL https://github.com/skoobe/riofs/archive/${RIOFS_VERSION}.tar.gz | tar -C riofs --strip-components 1 -xzf -

WORKDIR /riofs

RUN yum groupinstall -y 'Development Tools'
RUN yum install -y glib2-devel fuse-devel libevent-devel libxml2-devel openssl-devel
RUN ./autogen.sh && ./configure && make
