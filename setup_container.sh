#!/bin/bash

# Fonction Helper (Aide)
usage() {
  echo "Utilisation: $0 -u <username> -c <container_name>"
  echo "Options:"
  echo "  -u    Nom de l'utilisateur cible dans le conteneur"
  echo "  -c    Nom du conteneur Docker cible"
  echo "  -h    Affiche cette aide"
  exit 1
}

# Initialisation des variables
USERNAME=""
CONTAINER=""

# Récupération des arguments
while getopts "u:c:h" opt; do
  case $opt in
  u) USERNAME="$OPTARG" ;;
  c) CONTAINER="$OPTARG" ;;
  h) usage ;;
  *) usage ;;
  esac
done

# Vérification que les paramètres obligatoires sont bien fournis
if [ -z "$USERNAME" ] || [ -z "$CONTAINER" ]; then
  echo "Erreur : L'utilisateur (-u) et le conteneur (-c) sont requis."
  echo ""
  usage
fi

echo "🚀 Exécution du script d'installation dans '$CONTAINER' pour l'utilisateur '$USERNAME'..."
docker exec -i --user "$USERNAME" "$CONTAINER" bash <~/Documents/dotfiles/install_in_container.sh

echo "🔑 Copie des clés SSH..."
# Petite sécurité ajoutée : s'assurer que le dossier .ssh existe dans le conteneur avant de copier
docker exec --user "$USERNAME" "$CONTAINER" mkdir -p /home/"$USERNAME"/.ssh

docker cp ~/.ssh/id_rsa.pub "$CONTAINER":/home/"$USERNAME"/.ssh/
docker cp ~/.ssh/id_rsa "$CONTAINER":/home/"$USERNAME"/.ssh/
docker cp ~/.opencode/ "$CONTAINER":/home/"$USERNAME"/

echo "✅ Terminé avec succès !"
