#!/bin/bash
createDB(){
   echo -n "Please enter the Database name to create :";
   read dbName ;
   
   if test -d "./DBs/$dbName"
      then
      
       echo "Databas already exist "
                 
   else 
      mkdir ./DBs/$dbName 
   #    #clear ;
      echo "Data Base Created Successfuly!" 
   #    # export $dbName
   #    # cd ./$dbName
   fi 



   
         
}

createDB

