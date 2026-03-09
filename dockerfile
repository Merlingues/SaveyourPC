FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    curl \
    fortune \
    nginx \
    nsnake \
    sl \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m user
RUN useradd -m admin && echo "admin:letmein" | chpasswd

#Ajout des commandes
RUN mkdir /usr/gamebinaire
RUN mkdir /usr/adminbinaire
COPY commandes/ /usr/gamebinaire

#Limitation des commandes
RUN ln -s /usr/bin/fortune /usr/gamebinaire/fortune && \
    ln -s /usr/bin/nsnake /usr/gamebinaire/nsnake && \
    ln -s /usr/bin/pwd /usr/gamebinaire/pwd && \
    ln -s /usr/bin/cd /usr/gamebinaire/cd && \
    ln -s /usr/bin /usr/gamebinaire && \
    ln -s /usr/bin/cat /usr/gamebinaire/cat && \
    ln -s /usr/bin/clear /usr/gamebinaire/clear && \
    ln -s /usr/bin/fortune /usr/gamebinaire/fortune && \
    ln -s /usr/bin/nsnake /usr/gamebinaire/nsnake && \
    ln -s /usr/bin/sl /usr/gamebinaire/sl && \
    ln -s /usr/bin/echo /usr/gamebinaire/echo

#limiter seulement pour le compte admin
RUN ln -s /usr/bin/ps-list /usr/adminbinaire/ps-list && \
    ln -s /usr/bin/kill-proc /usr/adminbinaire/kill-proc && \
    ln -s /usr/bin/exit /usr/adminbinaire/exit && \
    ln -s /usr/gamebinaire/* /usr/adminbinaire && \

#Ajout des différents éléments dans le .bashrc des différents users
RUN cat datas/memo.txt >> /etc/motd
RUN cat "echo /etc/motd" >> /home/user/.bashrc
RUN cat datas/bashrc >> /home/user/.bashrc
RUN echo "PATH = "/usr/gamebinaire"" >> /home/user/.bashrc
RUN echo "PATH = "/usr/adminbinaire"" >> /home/admin/.bashrc
RUN chmod +x /usr/gamebinaire/* && chmod +x /usr/adminbinaire/*

#Ajout des différents scripts 
RUN mkdir -p /foret/maison
COPY scripts/voyante.sh /foret/maison/voyante.sh
RUN chmod 777 /foret/maison/voyante.sh
COPY scripts/help.sh /opt/scripts/help.sh
RUN chmod 755 /opt/scripts/help.sh
COPY scripts/ice.sh /opt/scripts/ice.sh
RUN chmod 755 /opt/scripts/ice.sh
COPY scripts/victoire.sh /opt/scripts/victoire.sh
RUN chmod 755 /opt/scripts/victoire.sh

#Création du site web factice
COPY datas/index.html /var/www/html/index.html
EXPOSE 80
CMD ["nginx", "-g","daemon off"]
RUN echo "127.0.0.1 www.euroscope.mmn" >> /etc/hosts

#Préparation de l'environnement de départ
WORKDIR /home/user
USER user