#! /bin/bash
dir=$(dirname "${0}")
gg="${dir}/juicy-gcode"
pt="${dir}/traitement.sh"

if [ -f "${1}" ] && [ -r "${1}" ] ; then
else
	echo "Impossible  de lire le fichier en entrée, ou celui-ci n'est pas valide ou n'existe pas."
	exit -1 
fi

if [ -x "${gg}" ] ; then
else
	echo "Le programme de conversion ne semble pas pouvoir être utilisé."
	exit -1
fi

if [ -e "${1}.bmp" ] || [ -e "${1}.svg" ]  ; then
	echo 'Le fichier '"${1}"'.bmp existe déjà. Veuillez libérer ce nom nécessaire pour certaines étapes de la conversion en gcode.'
	exit -1
fi

if convert "${1}" "${1}.bmp" ; then
else
	echo 'Impossible de convertir l'"'"'image en bmp (bitmap) à l'"'"'aide de convert.'
	exit -1
fi

if potrace -s "${1}.bmp"
else
	echo "Echec lors de la  (re-)vectorisation de l'image."
	exit -1
fi

./gg "${1}.svg" > "${1}.pgcode"
if $? ; then
else 
	echo "Erreur lors de la génération du gcode depuis l'image vectorisée."
	exit -1
fi

./pt "${1}.pgcode" > "${1}.gcode"
if $? ; then
else
	echo "Erreur lors du post-traitement du gcode."
	exit -1
fi

eog "${1}.svg"

return 0

#Ecrit par Jean OUSTRY
#Fournit sous license MIT-X11



