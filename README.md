# Save your PC !

Bienvenue dans le dépôt officiel de **Save your PC**, un Escape Game immersif en ligne de commande conçu pour sensibiliser à l'univers Linux et à l'open source.

---

## 🚀 Installation et Lancement

Pour relever le défi, vous devez disposer de Docker installé sur votre machine. Suivez ces étapes pour déployer l'environnement de jeu

1.  **Cloner le dépôt :**
    ```bash
    git clone https://github.com/Merlingues/SaveyourPC
    ```
2.  **Construire l'image :**
    ```bash
    docker compose build
    ```
3.  **Lancer le conteneur en arrière-plan :**
    ```bash
    docker compose up -d
    ```
4.  **Rejoindre la partie :**
    ```bash
    docker exec -it --user user "SaveyourPC" bash
    ```

---

## 📜 Histoire et Mise en contexte

Vous incarnez le meilleur technicien informatique du pays, habitué aux situations de crise. Le gouvernement vous contacte en urgence : le PC d'un agent a été piraté.

À votre arrivée, vous découvrez qu'un pirate facétieux a pris le contrôle du système. Il a lancé un processus destructeur nommé **"ICE"**. Votre mission est simple mais périlleuse : vous avez **10 minutes** pour infiltrer le compte administrateur et stopper le processus avant que l'intégralité des données ne soit définitivement effacée.

L'intégralité de l'intervention s'effectue via un terminal Linux. Soyez vif : le temps presse et certaines commandes pourraient s'avérer trompeuses.

---

## ⚠️ SPOILER : Résolution de l'Escape Game

> [!CAUTION]
> **Attention :** Ce paragraphe contient la solution complète de l'énigme. Ne le lisez pas si vous souhaitez découvrir le jeu par vous-même.

Pour sauver le système, suivez ces étapes clés:
* **Identification :** Utilisez la commande `curl` pour consulter le site `www.euroscope.mmn`. Vous y trouverez des indices sur la localisation des codes d'accès cachés dans le système de fichiers.
* **Localisation et Chiffrement :** Naviguez dans les dossiers pour trouver les identifiants. Le mot de passe est chiffré selon la méthode de **César (+5)**.
* **Décryptage :** En analysant les articles sur le site (mentionnant Jules César), déduisez la clé pour obtenir le mot de passe en clair : `letmein`.
* **Action finale :** Connectez-vous au compte **Admin** via la commande `login`. Une fois authentifié, identifiez le processus malveillant `ICE` et utilisez la commande `pkill` (ou l'équivalent autorisé) pour l'arrêter définitivement et remporter la victoire.
