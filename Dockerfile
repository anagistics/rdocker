FROM rhub/r-minimal

RUN apk add --no-cache --update-cache \
        --repository http://nl.alpinelinux.org/alpine/v3.11/main \
        autoconf=2.69-r2 \
        automake=1.16.1-r0 \
        postgresql-client=12.7-r0 && \
    # repeat autoconf and automake (under `-t`)
    # to (auto)remove them after installation
    installr -d \
        -t "bash libsodium-dev curl-dev linux-headers autoconf automake" \
        -a libsodium \
        plumber

RUN apk add --no-cache --update-cache \
        --repository http://nl.aplinelinux.org/alpine/v3.11/main \
        gcc \
        g++ \
        libc-dev \
        libstdc++6 \
        autoconf=2.69-r2 \
        automake \
        postgresql-dev \
        postgresql-client=12.7-r0 && \
        installr -d \
           -t "bash gcc libc-dev libstdc++6 autoconf automake linux-headers postgresql-dev" \
           -a libpq libc libstdc++6\
           RPostgres

           
