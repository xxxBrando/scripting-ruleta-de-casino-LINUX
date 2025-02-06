#!/bin/bash
#DECLARACION DE COLORES 
#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
#CTRL_C
ctrl_c()
{
  echo -e "\n Saliedo...\n"
  exit 1 
}
trap ctrl_c INT
##DECLARACIONES DE FUNCIONES 
panelDeAyuda()
{
  echo -e "${yellowColour}m)h)${endColour}${blueColour}[~]${endColour}${grayColour}Se coloca el dinero y tecnica deseadas${endColour}"
}

martingala()
{
  echo -e "Dinero actual:$money$"
  echo -n "¿Cuanto dinero tienes pensado apostar? --" && read initial_bet
  echo -n "¿A que numero deseas apostar continuamente (par/inpar)? -- " && read par_impar
  
  echo -e "Vamos a jugar con una cantidad de:$initial_bet a numero:$par_impar"

 while true; do
   random_nume="$(($RANDOM % 37))"
   echo -e "Ha salido el numero: $random_nume"
   sleep 4 
   if [[ $(($random_nume % 2)) -eq 0 ]]; then
  if [[ $random_nume -eq 0 ]]; then
    echo -e "Ha salido el cero por tanto perdemos"
    else
      echo "su numero es par"
  fi
else 
  echo -e "Su numero es impar"
 fi
done 
}

#DECLARACION DE ARGUMENTOS
while getopts "m:t:h" arg; do 
case $arg in 
  m)money=$OPTARG; chivato1=1;;
  t)tecnic=$OPTARG; chivato2=1;;
  h);;
esac 
done

if [[ $chivato1 ]] && [[ $chivato2 ]]; then
   if [[ $tecnic == "martingala" ]]; then
     martingala 
     else
      echo "no escojiste la tecnica correcta"
   fi



else
  panelDeAyuda
fi 
