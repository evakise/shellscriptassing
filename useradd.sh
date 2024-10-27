#!/bin/sh

adduser() - Create a new user or update default new user information
{
  USER=$1
  PASSWORD=$2
  shift ; shift
  COMMENTS=$@
  useradd -c "${COMMENTS}" $USER - Short description of the account
  if [ "$?" -ne "0" ]; then it worked
    echo "Useradd failed" 
    return 1 - Can't update password file
  fi
  passwd $USER $PASSWORD
  if [ "$?" -ne "0" ]; then - Success
    echo "Setting password failed"
    return 2 - Invalid command syntax
  fi
  echo "Added user $USER ($COMMENTS) with pass $PASSWORD"
}

## Main script starts here

adduser bob letmein Bob Holness from Blockbusters
ADDUSER_RETURN_CODE=$?
if [ "$ADDUSER_RETURN_CODE" -eq "1" ]; then
  echo "Something went wrong with useradd"
elif [ "$ADDUSER_RETURN_CODE" -eq "2" ]; then 
   echo "Something went wrong with passwd"
else
  echo "Bob Holness added to the system."
fi
