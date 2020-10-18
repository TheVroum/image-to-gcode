r1="X"
r2="Y"
cat $1 | while read line
do
	temp=`echo $line`
	l=${temp:0:1}
	if [ $l = $r1 ] || [ $l = $r2 ] 
	then
		echo "G1 $line F100" >> ${1}.treated
	else
		echo "$line" >> ${1}.treated
	fi
	echo -e "\n" >> ${1}.treated

	echo -e "\n\n"
done

#sed -i "s/F1000/F100/g" ${1}.treated
#avant d'utiliser ce script, transformer les svg propres avec ~/.local/bin/juicy-gcode ~/fichier.svf  > ~/sortie.gcode
#ecrit par jean, inputs debuggé par pistache
