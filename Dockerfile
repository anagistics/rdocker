FROM rhub/r-minimal:4.1.0

RUN apk add --no-cache --update-cache \
        --repository http://nl.alpinelinux.org/alpine/v3.11/main \
        autoconf=2.69-r2 \
        automake=1.16.1-r0 \
        curl=7.67.0-r4 \
        curl-dev=7.67.0-r4 \
        postgresql-dev=12.7-r0 \
        icu-dev=67.1-r0 && \ 
    installr -c \
        -t "bash libsodium-dev curl-dev linux-headers autoconf automake" \
        -a "libsodium libstdc++6" \
        plumber readr RPostgres 
          
WORKDIR /usr/src/app

COPY src/*.R ./

EXPOSE 3000

ENTRYPOINT ["Rscript", "/usr/src/app/runner.R"]


