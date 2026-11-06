FROM ubuntu:26.04 AS download

RUN apt-get update \
	&& apt-get install -y --no-install-recommends ca-certificates curl unzip \
	&& rm -rf /var/lib/apt/lists/*

RUN curl --fail --location --silent --show-error \
		https://github.com/ec-/Quake3e/releases/download/latest/quake3e-linux-x86_64.zip \
		-o /tmp/quake3e.zip \
	&& unzip -p /tmp/quake3e.zip quake3e.ded.x64 > /tmp/quake3e.ded.x64

FROM ubuntu:26.04

RUN useradd --system --create-home --home-dir /home/q3user_svc \
	--shell /usr/sbin/nologin q3user_svc \
	&& mkdir -p /home/q3user_svc/.q3a \
	&& chown q3user_svc:q3user_svc /home/q3user_svc/.q3a

COPY --from=download /tmp/quake3e.ded.x64 /usr/local/bin/quake3e.ded.x64
COPY --chown=q3user_svc:q3user_svc launcher.sh /home/q3user_svc/.q3a/launcher.sh

RUN chmod 0555 /usr/local/bin/quake3e.ded.x64 /home/q3user_svc/.q3a/launcher.sh

WORKDIR /home/q3user_svc/.q3a
USER q3user_svc

ENTRYPOINT ["/home/q3user_svc/.q3a/launcher.sh"]
