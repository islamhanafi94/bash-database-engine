#!/bin/bash

useDB(){
    clear
    echo  "****** Connect to DataBase ******"
   echo  "---------------------------------"
    echo -n "Please Enter Database Name: ";
    read dbName
    echo "------------------------"
    if [[ -n ./DBs/$dbName ]] #not an empty String   
    then
        if [[ -d "./DBs/$dbName" ]]
        then
            clear
            cd ./DBs/$dbName
            echo  "you are connected to $dbName "
            echo  "-------------------------"
            # cd ../.. 
            # pwd
             . ../.././crud.sh
            
        else
            clear;
            echo "There's no database with name $dbName"
            . ./backtoMain.sh
            
        fi
    else
        echo "please enter Datbase name"
        
    fi
}
useDB