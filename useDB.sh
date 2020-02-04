#!/bin/bash
useDB(){
    echo "Plz enter the Database Name";
    read dbName
    if [[ -n ./DBs/$dbName ]] #not an empty String   
    then
        if [[ -d "./DBs/$dbName" ]]
        then
            # export dbName
            cd ./DBs/$dbName
            echo  "you connected to $dbName "
            
        else
            echo "There's no database with name $dbName"
            
        fi
    else
        echo "please enter Datbase name"
        
    fi
}
useDB