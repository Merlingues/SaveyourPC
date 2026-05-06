FROM ubuntu:latest

# Installation des paquets (Attention : fortune, sl et nsnake s'installent dans /usr/games/)
RUN apt-get update && apt-get install -y \
    curl \
    fortune \
    nginx \
    nsnake \
    dos2unix\
    sl \
    && rm -rf /var/lib/apt/lists/*

# Création des utilisateurs
RUN useradd -m user
RUN useradd -m admin && echo "admin:letmein" | chpasswd

# 1. Création des dossiers et copie de tes scripts persos
RUN mkdir /usr/gamebinaire /usr/adminbinaire
COPY commandes/ /usr/gamebinaire/
COPY commandes/ /usr/adminbinaire/
COPY admincommandes/ /usr/adminbinaire/

RUN chmod +x /usr/gamebinaire/* || true
RUN chmod +x /usr/adminbinaire/* || true
RUN chmod u+s /usr/bin/pkill
RUN chmod u+s /bin/kill

# 3. Création des liens vers les commandes système (les jeux sont dans /usr/games/)
RUN ln -s /usr/games/fortune /usr/gamebinaire/fortune && \
    ln -s /usr/games/nsnake /usr/gamebinaire/nsnake && \
    ln -s /usr/games/sl /usr/gamebinaire/sl && \
    ln -s /usr/bin/pwd /usr/gamebinaire/pwd && \
    ln -s /usr/bin/cat /usr/gamebinaire/cat && \
    ln -s /usr/bin/clear /usr/gamebinaire/clear && \
    ln -s /usr/bin/echo /usr/gamebinaire/echo

# Liens pour l'admin (ps au lieu de ps-list)
RUN ln -s /usr/bin/ps /usr/adminbinaire/ps

# 4. Configuration des profils utilisateurs (.bashrc et motd)
COPY datas/ /opt/datas/
RUN cat /opt/datas/memo.txt >> /etc/motd

# Correction de la syntaxe bash (export et pas d'espaces)
RUN echo "cat /etc/motd" >> /home/user/.bashrc
RUN cat /opt/datas/bashrc >> /home/user/.bashrc
RUN echo 'export PATH="/usr/gamebinaire"' >> /home/user/.bashrc
RUN echo 'export PATH="/usr/adminbinaire"' >> /home/admin/.bashrc
RUN rm -rf /opt/datas/

# 5. Ajout des différents scripts de l'aventure
RUN mkdir -p /foret/maison /opt/scripts
COPY scripts/voyante.txt /foret/maison/voyante.txt
COPY scripts/ice.sh /opt/scripts/ice.sh
RUN chmod 755 /opt/scripts/ice.sh
COPY scripts/victoire.sh /opt/scripts/victoire.sh
RUN chmod 755 /opt/scripts/victoire.sh

# 6. Création du site web factice
COPY datas/index.html /var/www/html/index.html
EXPOSE 80

# Démarrage de nginx (en tâche de fond pour que le conteneur reste en vie)
CMD ["nginx", "-g", "daemon off;"]
