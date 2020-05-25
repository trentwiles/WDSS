#!/bin/bash

########################################################
#                                                      #
#         For Dev info, please contact me:             #
#         https://riverside.rocks/contact              #
#                                                      #
#           Copyright 2020 Trent Wiles                 #
#          For lisence please see LISENCE              #
#                                                      #
########################################################

# NOTES (read before use outside of Riverside Rocks)
# The API key is left blank for security! Replace it
# with your MailGun API key.

key="API-Key_Here"

echo "SubSystem Main Admin"
echo " "
echo "Use 1 to send an account termination notice."
sleep 1
echo "Use 2 to send a welcome message."
sleep 1
echo "More commands are coming soon."
sleep 1
while true
do
  read -p ">>>>" com
  if [ "$com" = "1" ]
  then
    echo "You picked `send a ban message`:"
    read -p "Client Email" eml
    if [ "$eml" = "" ]
    then
      echo "FATAL: Sorry, you entered nothing. Killing program."
      ^c
     else
     then
       echo "Sending Mail..."
       curl -s --user 'api:${key}' \
       https://api.mailgun.net/v3/mail.riverside.rocks/messages \
       -F from='Excited User <mailgun@mail.riverside.rocks>' \
       -F to=system@mail.riverside.rocks \
       -F to=${eml} \
       -F subject='Account Notice' \
       -F text='We are sorry, but the account with the email ${eml} has been terminated. Please log in at riverside.rocks/login for more.'
        echo "Done."
        sleep 3
      fi
    fi
