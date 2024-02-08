#checking if the requested user is root user
if [ $(id -u) -ne 0 ]
then
	echo "User must root-kaushik to create users"
	exit 1
fi

#checking if the username as argument is provided
if [ $# -ne 2 ]
then
	echo "usage: $0 <username>:<password>"
	exit 1
fi

#extacting username and password
username=$1
password=$2

#checking if the username already exists
if id "$username" &>/dev/null;
then
	echo "User $username already exists"
	exit 1
fi

#creating user
dscl . -create /Users/"$username"
dscl . -create /Users/"$username" UserShell /bin/bash
dscl . -create /Users/"$username" RealName "$username" 
dscl . -create /Users/"$username" UniqueID "2001" 
dscl . -create /Users/"$username" PrimaryGroupID "90"
dscl . -create /Users/"$username" NFSHomeDirectory "/Users/$username"
dscl . -passwd /Users/"$username" $password

#checking if user creation is success
if [ $? -eq 0 ]
then
	echo "User creation successful"
else
	echo "User creation failed"
fi



