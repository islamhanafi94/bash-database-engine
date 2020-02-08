selectFromTable(){
    clear
    echo -n "Enter Table name : "
    read tableName
    if [[ -f $tableName ]]; 
    then
        clear
        awk -F# '{print $0}' $tableName
   elif [ "$tableName" = "" ]; 
      then
        echo "Invalid ";
  fi
    . ../.././backmenuTable.sh
}

selectFromTable