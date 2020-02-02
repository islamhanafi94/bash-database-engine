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
    2)  echo 1 ;;
    3)  echo 1 ;;
    4)  echo 1 ;;
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
    echo "------------------------"
    PS3="What Do you want to do ? : ";
    select varName in "Back to menu" "Exit"
    do
	case $varName in
		"Back to menu")
			clear;
            RunDBMS;
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
RunDBMS

