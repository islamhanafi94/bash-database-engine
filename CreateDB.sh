#!/bin/bash
createDB(){
   echo  "****** Create New DataBase ******"
   echo  "---------------------------------"
   echo -n "Please enter the Database name to create : ";
   read dbName ;
   
   if test -d "./DBs/$dbName"
      then
      echo "------------------------"     
      echo "Databas already exists! "
      . ./backtoMain.sh
                 
   else 
      mkdir ./DBs/$dbName
      echo "----------------------------"     
      echo "DataBase Created Successfuly!"
      backToMainMenu
   fi 
}



backToMainMenu(){
    PS3="What Do you want to do ? : ";
    echo "------------------------"
    select varName in "Back to menu"  "Exit"
    do
	case $varName in
		"Back to menu")
			clear;
            . ./bashdb.sh;
            break;
            ;;

		"Exit")
			clear;
            exit;
            ;;
		*)
            clear;
            exit;
            ;;
	esac			
done
}
createDB

# TO-DO
# 1) Add validation on database name ( not empty , one word)
# 2) add redirection "connect to this particular database after creation"