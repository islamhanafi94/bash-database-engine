#!/bin/bash
function crud (){
  echo -e "*****Tables Menu****"
  echo "1) list Tables "
  echo "2)Create New Table   "
  echo "3)Insert Into Table  "
  echo "4)Select From Table  "
  
  echo "5)Delete From Table  "
  echo "6)Drop Table         "
  echo "7) Back To Main Menu "
  echo "8) Exit              "
  echo "********************"
  echo -n "Your Command : "
  read ch
  case $ch in
    1) clear ;ls -A ./DBs/$dbName; crud ;;
    2)  2;;
    3)  3;;
    4)  4;;
    5)  5;;
    6)  6;;
    7)  7;;
    8) clear; cd ./bashdb.sh; mainMenu ;;
    9) exit ;;
    *) echo " Wrong Choice " ; crud;
  esac

}


# showTables(){
#     clear
#     pwd
#  if [ -z "$(ls -A -- "/home/ismail/Desktop/bash-database-engine/DBs/$dbName")" ]; 
#             then
#                 echo "Empty Database"
#             else
#                 for table in `ls -I "*.md" /DBs/$dbName `
#                 do
#                     echo "$table"
#             done
# fi
# }
crud
