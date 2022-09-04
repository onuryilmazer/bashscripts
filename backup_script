#!/bin/bash

# Author: Onur YILMAZER
# Date Created: 04/09/2022
# Last Modified: 04/09/2022

# Description
# Creates a backup of the user's home directory in the current working directory.

# Usage
# backup_script

backupdir="$(pwd)/backups"

echo "Backing up ${HOME} for ${USER^} in ${backupdir}"

mkdir -p -v "${backupdir}"

tar -cvzf "${backupdir}"/bkp_"${USER}_$(date +%d-%m-%Y_%H:%M:%S)".tar.gz "${HOME}" 2>"${backupdir}"/errors.log 1>"${backupdir}"/backup.log

echo "Backup completed. Check the errors.log and backup.log files for any possible errors and the files that were backed up."

exit 0
