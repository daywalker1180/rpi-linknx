FROM resin/rpi-raspbian:jessie
MAINTAINER Martin Kottrasch <martin.kottrasch@gmx.at>


# Install dependencies
RUN     apt-get update && \
        apt-get install -y liblua5.1-0 liblog4cpp5 libesmtp6


ARG	VERSION

ADD	https://github.com/linknx/linknx/archive/refs/tags/0.0.1.38.tar.gz
RUN	mv 0.0.1.38.tar.gz linknx-0.0.1.38.tar.gz
RUN	tar -xzf linknx-0.0.1.38.tar.gz
RUN 	cd linknx-0.0.1.38
RUN	./configure --with-log4cpp
RUN	make
RUN	make install

#ADD 	https://github.com/heziegl/rpi-linknx-build/raw/master/dist-$VERSION/linknx /linknx
ADD     https://github.com/heziegl/rpi-linknx-build/raw/master/dist-$VERSION/libpthsem20_2.0.8_armhf.deb .

RUN	dpkg -i libpthsem20_2.0.8_armhf.deb && \
	rm libpthsem20_2.0.8_armhf.deb && \
	chmod +x linknx


VOLUME  ["/linknx_config", "/linknx_persist", "/linknx_log"]
CMD     ["./linknx", "--config=/linknx_config/linknx.xml"]

