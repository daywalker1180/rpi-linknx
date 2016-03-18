FROM resin/rpi-raspbian:jessie
MAINTAINER Heiko Ziegler <git@z5r.de>


# Install dependencies
RUN     apt-get update && \
        apt-get install -y liblua5.1-0 liblog4cpp5 libesmtp6


ARG	VERSION

ADD 	https://github.com/heziegl/rpi-linknx-build/raw/master/dist-$VERSION/linknx /linknx
ADD     https://github.com/heziegl/rpi-linknx-build/raw/master/dist-$VERSION/libpthsem-compat_2.0.8_armhf.deb .
ADD     https://github.com/heziegl/rpi-linknx-build/raw/master/dist-$VERSION/libpthsem-dbg_2.0.8_armhf.deb .
ADD     https://github.com/heziegl/rpi-linknx-build/raw/master/dist-$VERSION/libpthsem-dev_2.0.8_armhf.deb .
ADD     https://github.com/heziegl/rpi-linknx-build/raw/master/dist-$VERSION/libpthsem20_2.0.8_armhf.deb .

RUN	dpkg -i libpthsem*.deb && \
	rm libpthsem*.deb && \
	chmod +x linknx


VOLUME  ["/linknx_config", "/linknx_persist", "/linknx_log"]
#CMD     ./linknx --config=/linknx_config/linknx.xml --daemon=/linknx_log/linknx.log
CMD     ./linknx --config=/linknx_config/linknx.xml

