FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    curl \
    fortune \
    nsnake \
    sl \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m user
##Change le repertoire de travail.
WORKDIR /home/user

USER root
RUN useradd -m admin && echo "admin:letmein" | chpasswd
RUN cat datas/memo.txt >> /etc/motd
RUN cat "echo /etc/motd" >> /home/user/.bashrc

COPY help.sh /opt/scripts/help.sh
COPY ice.sh /opt/scripts/ice.sh
COPY victoire.sh /opt/scripts/victoire.sh
