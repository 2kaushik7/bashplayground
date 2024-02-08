chmod 755 hello.sh
./hello.sh
if [ $? -eq 0 ]
then
	echo 'chmod 755 hello.sh --> rwx-|rx-|rx- --> success'
fi

chmod 444 hello.sh
./hello.sh
if [ $? -ne 0 ]
then
echo 'chmod 444 hello.sh --> r--|r--|r-- --> fails'
fi
