#!/bin/bash

# Script pour changer l'email de l'auteur et du committer sur tous les commits de la branche main
# Ce script utilise git filter-branch pour réécrire l'historique

NEW_EMAIL="bastien.limbour.dev@gmail.com"
BRANCH="main"

echo "🔍 Vérification du repository Git..."

# Vérifier qu'on est dans un repo git
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Erreur: pas dans un dépôt Git"
    exit 1
fi

# Vérifier qu'on est sur la branche main
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "$BRANCH" ]; then
    echo "⚠️  Attention: vous n'êtes pas sur la branche $BRANCH"
    echo "   Branche actuelle: $CURRENT_BRANCH"
    read -p "Voulez-vous basculer sur $BRANCH? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git checkout "$BRANCH" || exit 1
    else
        echo "Opération annulée."
        exit 1
    fi
fi

# Créer une branche de backup
BACKUP_BRANCH="backup-before-email-change-$(date +%s)"
git branch "$BACKUP_BRANCH"
echo "✅ Branche de backup créée: $BACKUP_BRANCH"

echo ""
echo "📧 Modification de l'email pour tous les commits..."
echo "   Nouvelle adresse: $NEW_EMAIL"
echo ""
echo "⚠️  Cette opération va réécrire tout l'historique Git de la branche $BRANCH."
echo "   Une branche de backup a été créée: $BACKUP_BRANCH"
echo ""
read -p "Continuer? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Opération annulée."
    exit 1
fi

echo ""
echo "🔄 Réécriture de l'historique..."

# Utiliser git filter-branch pour changer l'email
git filter-branch --force --env-filter "
    export GIT_AUTHOR_EMAIL='$NEW_EMAIL'
    export GIT_COMMITTER_EMAIL='$NEW_EMAIL'
" --tag-name-filter cat -- --branches=$BRANCH

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Email changé avec succès pour tous les commits de la branche $BRANCH!"
    echo ""
    echo "📊 Vérification des changements..."
    echo ""
    echo "Échantillon des derniers commits:"
    git log --format="  %h - %an <%ae> - %s" -5
    echo ""
    echo "💡 Pour restaurer l'ancien historique:"
    echo "   git reset --hard $BACKUP_BRANCH"
    echo ""
    echo "⚠️  Pour pousser les changements (force push requis):"
    echo "   git push --force-with-lease origin $BRANCH"
    echo ""
    echo "   Assurez-vous que personne d'autre ne travaille sur ce repo!"
else
    echo ""
    echo "❌ Erreur lors de la modification de l'email"
    echo "   Pour restaurer: git reset --hard $BACKUP_BRANCH"
    exit 1
fi
