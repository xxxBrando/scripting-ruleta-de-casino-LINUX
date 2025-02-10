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
  echo -e "\n${yellowColour}m)h)${endColour}${blueColour}[~]${endColour}${grayColour}Se coloca el dinero y tecnica deseadas...${endColour}"
  
echo -e "\n-m):Se coloca la canntidad de dinero que se quiere apostar\n 
-t):se coloca la tecnica a jugar; martingala/inversa\n"
}

martingala()
{
  echo -e "Dinero actual:$money$"
  echo -n "¿Cuanto dinero tienes pensado apostar? --" && read initial_bet
  echo -n "¿A que numero deseas apostar continuamente (par/inpar)? -- " && read par_impar
  
  echo -e "Vamos a jugar con una cantidad de:$initial_bet a numero:$par_impar"
  back_bet=$initial_bet
 while true; do
   money=$(($money-$initial_bet))
   echo -e "\n Acabas de apóstar $initial_bet$ y tienes $money"
   random_nume="$(($RANDOM % 37))"
     echo -e "Ha salido el numero: $random_nume" 
      
    if [[ ! "$money" -le 0 ]]; then
     
     if [[ "$par_impar" == "par" ]]; then
          
           if [[ $(($random_nume % 2)) -eq 0 ]]; then
          if [[ $random_nume -eq 0 ]]; then
            echo -e "Ha salido el cero por tanto perdemos"
            initial_bet=$(($initial_bet*2))
          else
              echo "su numero es par, !ganas¡"
              reward=$(($initial_bet*2))
              echo -e "Ganas un total de $reward $"
              initial_bet=$back_bet
              money=$(($money+$reward))
              echo -e "Su dinero ahora es de :$money"
          fi
        else 
          echo -e "Su numero es impar,!pierdes¡"
          initial_bet=$(($initial_bet*2))
           fi
         sleep 0.4 
       fi
      else 
          echo -e "Te quedaste sin pinches dineros"
          break  
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
