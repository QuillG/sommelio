# Utilisation de l'image Flutter comme base
FROM cirrusci/flutter:latest AS build

# Création de l'utilisateur non privilégié pour exécuter les commandes Flutter
USER root
RUN adduser --disabled-password --gecos '' flutteruser

# Définition du répertoire de travail dans l'image
WORKDIR /app

# Copiez les fichiers de votre application Flutter dans le conteneur
COPY . .

# Changer l'utilisateur pour flutteruser pour exécuter les commandes suivantes
USER flutteruser

# Exécuter la configuration Flutter --enable-web (vous pouvez essayer de créer une exception pour le répertoire)
RUN flutter config --enable-web

# Installez les dépendances Flutter
RUN flutter pub get

# Build de l'application Flutter pour le web
RUN flutter build web
