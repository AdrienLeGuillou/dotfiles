#!/bin/bash
## Backup quotidien du home de "user"
set -e

echo -e ""
echo -e "     \e[55;15;5;12m***** sauvegarde des données de "user" *****\e[0m"
echo -e ""

# on exporte cette variable pour pouvoir supprimer une sauvegarde
export BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK=yes

# Pour pouvoir afficher une notification système il faut exporter cette variable:
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
# notification
notify-send 'Début de Sauvegarde des Données' --icon=dialog-information

# Unsafe
export BORG_PASSPHRASE='AgRp9X9QkN#xpNb$RicF'

SOURCEFOLDER="$HOME/Documents $HOME/DATA/Photos $HOME/DATA/MEGA $HOME/.config"
REPOSITORY='/run/media/adrien/a93cd53b-688a-4cb8-8dd7-f84341bbd877/borg_repo/'
EXCLUSIONS="$HOME/.config/borg/exclusions"
LOGFILE="$HOME/.local/share/borg-daily.log"

## Créer le rapport - on y dirigera les flux de sortie du script pour debuggage si besoin
{
    date "+%A %d %B %Y %Rh"
} > "$LOGFILE"

## création de la sauvegarde
borg create -v --stats --compression lzma,6 \
     -e '*.rds' \
     --exclude-caches \
     "$REPOSITORY::user_{now:%Y-%m-%d}" ${SOURCEFOLDER} &>> "$LOGFILE" || true
     # --exclude-from "$EXCLUSIONS" \

# ne conserver que les sauvegardes des : 7 derniers jours, 1/semaine pour les 4 dernières semaines et 1/mois pour les 3 derniers mois
echo -e ""
echo -e "     \e[55;15;5;12m***** Rotation sauvegarde *****\e[0m"
borg prune -v $REPOSITORY --keep-daily=7 --keep-weekly=4 --keep-monthly=4

## on peut compléter le rapport par un bilan :
{
   echo ""
   echo "Sauvegardes"
   borg list $REPOSITORY
   echo ""
   echo "Taille des Sauvegardes"
   du -sh $REPOSITORY
}  >> "$LOGFILE"

# notification
notify-send 'Sauvegarde des Données' \
   'Sauvegarde Terminée' --icon=dialog-information

## Si on a créé la variable BORG_PASSPHRASE ne pas oublier de la supprimer
## pour éviter qu'elle apparaisse avec la simple commande 'env' ... : décommentez donc ci-dessous
unset BORG_PASSPHRASE

exit 0

