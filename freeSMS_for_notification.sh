#!/bin/bash


# votre log free mobile
login=XXXXXX

# votre key générée par free
key=XXXXXXXX


read -p "Quel message souhaitez-vous envoyer ? " messageEntree

echo "$messageEntree" > .start.txt

sed 's/\s/%20/g' < .start.txt > .end.txt
messageSortie=$(head -n 1 .end.txt)
rm .start.txt
rm .end.txt

# envoi du sms avec curl
curl "https://smsapi.free-mobile.fr/sendmsg?user="$login"&pass="$key"&msg="$messageSortie""
sleep 0.5
echo "Le message a bien été envoyé"
