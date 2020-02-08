#!/bin/bash
function crud (){
  echo  "****** Tables Menu ******"
  echo  "-------------------------"
  echo "1) list Tables "
  echo "2) Create New Table   "
  echo "3) Insert Into Table  "
  echo "4) Select From Table  "
  echo "5) Delete From Table  "
  echo "6) Drop Table         "
  echo "7) Back To Main Menu "
  echo "8) Exit              "
  echo "********************"
  echo -n "What Do you want to do ? : ";
  read ch
  case $ch in
    1)  . ../.././showAllTabels.sh;;
    2)  . ../.././createTable.sh;;
    3)  . ../.././insertInTable.sh;;
    4)  . ../.././selectTable.sh;;
    5)  . ../.././deleteFromTable.sh;;
    6)  . ../.././dropTable.sh;;
    7) clear;
       cd ../..;
       . ./bashdb.sh 
       ;;
    8) exit ;;
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
# note : in this file we are in the database directory 
# and any other link will be relative to it 
# after finishing using this db we must cd to main folder