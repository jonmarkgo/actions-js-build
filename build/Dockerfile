FROM starefossen/ruby-node:2-8-alpine
RUN apk add --no-cache \
    autoconf \
    automake \
    bash \
    g++ \
    libc6-compat \
    libjpeg-turbo-dev \
    libpng-dev \
    make \
    nasm
LABEL version="1.0.0"
LABEL repository="https://github.com/jonmarkgo/actions-js-build"
LABEL homepage="https://github.com/jonmarkgo/actions-js-build"
LABEL maintainer="jonmarkgo <jonmarkgo@gmail.com>"

LABEL com.github.actions.name="GitHub Action to execute javascript build tools"
LABEL com.github.actions.description="Executes npm install, followed by gulp or grunt (whichever has a build file)."
LABEL com.github.actions.icon="truck"
LABEL com.github.actions.color="purple"
COPY LICENSE README.md THIRD_PARTY_NOTICE.md /

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["default"]
