user="temp06"

next_user="temp07"



gcc database_query.c -o next_password_generator
rm people.db
sqlite3 -init db_init.sql people.db .quit

# need to move over, dbquery.py, the compiled generator, the db itself
# permissions - dbquery.py, generator - next user owned
# dbquery.py - no other user read, generator - other read and suid bit
# database - remove write permissions from it - owned by this user

mv dbquery.py /home/$user/
mv next_password_generator /home/$user/
mv people.db /home/$user/

chown $next_user:$next_user /home/$user/dbquery.py /home/$user/next_password_generator
chmod 550 /home/$user/dbquery.py
chmod 555 /home/$user/next_password_generator

chmod g+s /home/$user/next_password_generator


chown $user:$user /home/$user/people.db
chmod 555 /home/$user/people.db

cp README.md /home/$user
chown $user:$user /home/$user/README.md
