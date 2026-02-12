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
RUN mkdir -p /foret/maison

COPY voyante.sh /foret/maison/voyante.sh
RUN chmod 777 /foret/maison/voyante.sh
COPY help.sh /opt/scripts/help.sh
RUN chmod 755 /opt/scripts/help.sh
COPY ice.sh /opt/scripts/ice.sh
RUN chmod 755 /opt/scripts/ice.sh
COPY victoire.sh /opt/scripts/victoire.sh
RUN chmod 755 /opt/scripts/victoire.sh