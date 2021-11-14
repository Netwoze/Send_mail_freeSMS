#!/bin/bash

# votre log free mobile
login=XXXXX

# votre key générée par free
key=XXXXX
cat << !

		 ▄▄▄▄▄▄▄▄▄▄▄  ▄▄       ▄▄  ▄▄▄▄▄▄▄▄▄▄▄ 
		▐░░░░░░░░░░░▌▐░░▌     ▐░░▌▐░░░░░░░░░░░▌
		▐░█▀▀▀▀▀▀▀▀▀ ▐░▌░▌   ▐░▐░▌▐░█▀▀▀▀▀▀▀▀▀ 
		▐░▌          ▐░▌▐░▌ ▐░▌▐░▌▐░▌          
		▐░█▄▄▄▄▄▄▄▄▄ ▐░▌ ▐░▐░▌ ▐░▌▐░█▄▄▄▄▄▄▄▄▄ 
		▐░░░░░░░░░░░▌▐░▌  ▐░▌  ▐░▌▐░░░░░░░░░░░▌
		 ▀▀▀▀▀▀▀▀▀█░▌▐░▌   ▀   ▐░▌ ▀▀▀▀▀▀▀▀▀█░▌
		          ▐░▌▐░▌       ▐░▌          ▐░▌
		 ▄▄▄▄▄▄▄▄▄█░▌▐░▌       ▐░▌ ▄▄▄▄▄▄▄▄▄█░▌
		▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌
		 ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀ 
                                       


!
read -p "		Appuier sur [ ENTRER ] pour continuer !"
sleep 0.2
envoie()
{
	curl "https://smsapi.free-mobile.fr/sendmsg?user="$login"&pass="$key"&msg="$messageSortie""
	echo "Le message a bien été envoyé"
	echo " "
	sleep 2
	saisie
}



saisie()
{
	echo "Choisir un nombre [1 - 3] "
	select option in "- Envoyer SMS de test -" "- Envoyer SMS personnalisé -" "- Quitter -"
	do
	echo "Vous avez choisi l'option $REPLY : $option"
		while [[ $REPLY -ne 1 || $REPLY -ne 2 ]]; do
			
		


	        if [ "$option" = "- Envoyer SMS de test -" ]; then
	        	messageSortie="Ceci%20est%20un%20message%20de%20test"
	        	envoie $messageSortie
	        	break

	        elif [ "$option" = "- Envoyer SMS personnalisé -" ]; then
	        	read -p "Quel message envoyer ? " messageEntree
				echo "$messageEntree" > .start.txt
				sed 's/\s/%20/g' < .start.txt > .end.txt
				messageSortie=$(head -n 1 .end.txt)
				rm .start.txt && rm .end.txt
				envoie $messageSortie
				break

	        elif [ "$option" = "- Quitter -" ]; then
	        	sleep 0.2
	        	echo "Fin du programme"
	        	sleep 0.5
	        	exit
				

			else
	            echo "mauvaise option"
	            sleep 1
	            echo " "
	            echo "Choisir un nombre [1 - 3]"
	            echo "1) - Envoyer SMS de test -"
	            echo "2) - Envoyer SMS personnalisé -"
	            echo "3) - Quitter -"
	            break
	        fi
	    done
	done

}

saisie



