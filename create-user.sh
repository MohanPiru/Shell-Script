# create user with command line arguments




#check root access

if [[ "${UID}" -ne 0 ]]
then 
   echo "please run with root "
   exit 1
fi

# check arguments if 0 or not

if [[ "${#}" -lt 1 ]]
then 
   echo "please give arguments"
   exit 1
fi

USER_NAME="${1}"
shift
comment="${@}"

PASSWORD=$(date +%s%N)

useradd -c "$comment" -m $USER_NAME

#check user is created or not

if [[ $? -ne 0 ]]
then 
  echo "account not created "
  exit 1 
fi

echo $PASSWORD | passwd --stdin &USER_NAME

if [[ $? -ne 0 ]]
then 
  echo "password not set "
  exit 1 
fi

# force password change

passwd -e $USER_NAME

echo "user name : $USER_NAME"
echo " password : $PASSWORD "
 
