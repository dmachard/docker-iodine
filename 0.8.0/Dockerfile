FROM debian:12-slim as builder

ENV NAME=iodine \
    VERSION=0.8.0 \
    DOWNLOAD_URL=https://code.kryo.se/iodine/iodine-0.8.0.tar.gz

RUN apt-get -y update && \
    apt-get install -y curl make gcc pkg-config libz-dev net-tools && \
    curl -sSL $DOWNLOAD_URL -o iodine.tar.gz && \
    tar xzf iodine.tar.gz && \
    cd $NAME-$VERSION/ && \
    make && \
    make install

FROM debian:12-slim

COPY --from=builder /usr/local/sbin/iodine /usr/local/sbin/
COPY --from=builder /usr/local/sbin/iodined /usr/local/sbin/

COPY entry.sh /entry.sh
RUN chmod +x /entry.sh

ENTRYPOINT [ "/entry.sh" ]
