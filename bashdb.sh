#!/bin/bash


# main menu 
RunDBMS () {

  echo  "****** BashDBMS ******"
  echo "1) Show all Databases"
  echo "2) Create new Database"
  echo "3) Connect to Database"
  echo "4) Delete Database"
  echo "5) Help"
  echo "6) Exit"
  echo  "*******************"
  echo -n "Your Command : "
  read ch
  case $ch in
    1)  listDB ;; #show all function
    2)  createDB ;;
    3)  echo 1 ;;
    4)  deleteDB ;;
    5)  echo 2 ;;
    6)  exit;;
    *) echo " Invalid input " ; 
        clear;   
        RunDBMS;
  esac

}   

listDB (){
    clear;
    echo ">>>>>Databases list<<<<<"
    ls -1 ./DBs; # how to display list in new line
    backToMainMenu

}

backToMainMenu(){
    PS3="What Do you want to do ? : ";
    echo "------------------------"
    select varName in "Back to menu" "Exit"
    do
	case $varName in
		"Back to menu")
			clear;
            RunDBMS;
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
createDB (){
    clear;
    echo ">>>>> Create new Database <<<<<"
    echo -n "Enter Database name : "
    read DBname
    # we should check if the name is already taken
    mkdir ./DBs/$DBname;
    backToMainMenu;
    
}

deleteDB() {
    clear;
    echo ">>>>>Databases list<<<<<"
    echo -n "Enter Database name : "
    read droppedDB
    rm -r DBs/$droppedDB
    if [ $? -eq 0 ]; 
    then 
        echo "${droppedDB} Database Removed Successfuly!"
    else 
        echo "Failed!" 
    fi
    backToMainMenu
}

RunDBMS