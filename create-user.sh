# create user with command line arguments


#check the script is running as root or not
#root is is always 0

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 
   exit 1
fi

# check number os arguments if 0 or not

if [ "${#}" -lt 1 ]
then 
   echo "please give arguments"
   exit 1
fi

#taking 1st argument as username and others as comments

USER_NAME="${1}"
shift
comment="${@}"

#setting a random password 

PASSWORD=$(date +%s%N)

#creating user with the comment 

useradd -c "$comment" -m $USER_NAME


#check user is created or not
# '$?' checks whether the previous command is successful or not(0 means successful)

if [ $? -ne 0 ]
then 
  echo "account not created "
  exit 1 
fi

#setting password for the user 

echo "$USER_NAME:$PASSWORD" | chpasswd

if [ $? -ne 0 ]
then 
  echo "password not set "
  exit 1 
fi


# force to change password after the first login

passwd -e $USER_NAME

echo "user name : $USER_NAME"
echo " password : $PASSWORD "
