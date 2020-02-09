#!/bin/bash
createDB(){
   echo  "****** Create New DataBase ******"
   echo  "---------------------------------"
   echo -n "Please enter the Database name to create : ";
   read dbName ;
   
    if [[ $dbName = "" ]]; then
     echo "Databas name can't be null! "
     
     createDB
     read dbName
     

   elif test -d "./DBs/$dbName"
      then
      echo "------------------------"     
      echo "Databas already exists! "
       createDB
     read dbName
      . ./backtoMain.sh
                 
   
   elif [[ $dbName =~ ^[a-zA-Z] ]]; then
      mkdir ./DBs/$dbName
      echo "----------------------------"     
      echo "DataBase Created Successfuly!"
      backToMainMenu
     

   elif [[ $dbName =~ [/.:\|\-] ]]; then
     echo -e "DataBase cannot named with special character" 
     createDB
     read dbName

   else
        echo -e "plz enter valid DB name"
        createDB
        read dbName
        
   
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