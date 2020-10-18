##Comment utiliser ?
Note : le sigle dollar ($) suivi d'une ligne de commande(s) indique des commandes à lancer dans un shell. Le $ ne doit pas être inclus dans la(les) commande(s).

Créer un dossier où seront générés les fichiers intermédiaires ainsi que le gcode.
Y placer l'image que vous souhaitez traiter (vectorielle ou non).
(Les formats supportés sont ceux supportés par convert : https://imagemagick.org/script/formats.php.)
Ouvrir une invite de commande et se placer dans ce dossier (à l'aide de la commande cd).
Lancer la commande suivante :
cut.sh $image
Où $image est le nom de l'image à traiter.

Les gcode seront alors générés dans le même dossier (il s'agit du fichier .gcode (pas ceux .pgcode)).
Un aperçu du parcours du laser aura également été ouvert afin que vous puissiez vérifier si celui-ci est tel qu'attendu.

Enfin, ce gcode peut être envoyé à la machine via un programme tel que universal-gcode-sender par exemple :
https://github.com/winder/Universal-G-Code-Sender

Bonne découpe et bon bidouillage !
##A faire sur un nouveau système : Dépendances (les commandes suivantes pour l'installation des dépendances fonctionnent sur les distributinos debian-based) :
###Potrace doit être installé : 
$ sudo apt update && sudo apt upgrade && sudo apt install potrace
###Eog doit être installé :
$ sudo apt update && sudo apt upgrade && sudo apt install eog
###Convert doit être installé (imagemagick) :
$ sudo apt update && sudo apt upgrade && sudo apt install imagemagick
###Ajouter au PATH le répertoire contenant le script cut.sh (est-ce la bonne manière de faire ?) :
Se placer dans le répertoire à l'aide cd, puis exécuter :
echo '' > ~/.profile && echo 'PATH=$PATH:' >> ~/.profile
