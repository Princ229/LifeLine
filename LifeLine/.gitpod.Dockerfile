FROM gitpod/workspace-full

USER gitpod

RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh && sdk install java 11.0.10-open"

RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.6-stable.tar.xz \
    && tar xf flutter_linux_3.10.6-stable.tar.xz \
    && rm flutter_linux_3.10.6-stable.tar.xz

ENV PATH="$PATH:/home/gitpod/flutter/bin"

RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web
RUN flutter doctor