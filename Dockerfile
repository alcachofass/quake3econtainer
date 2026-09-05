FROM ubuntu:latest

RUN apt update \
	&& apt upgrade -y \
	&& apt install curl unzip -y

RUN curl -SL https://github.com/ec-/Quake3e/releases/download/latest/quake3e-linux-x86_64.zip -o /tmp/q3e.zip \
	&& unzip /tmp/q3e.zip -d /usr/bin/ \
	&& rm /tmp/q3e.zip \
	&& chmod +x /usr/bin/quake3e.ded.x64

RUN useradd -d /home/q3user_svc -m -s /sbin/nologin q3user_svc

USER q3user_svc

ENTRYPOINT ["/bin/bash", "/home/q3user_svc/.q3a/launcher.sh"]
