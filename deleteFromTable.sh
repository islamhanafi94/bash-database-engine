deleteFromTable(){
    clear
    echo -n "Enter Table name : "
    read tableName
    if [[ -f $tableName ]]; 
    then
        echo -n "Enter Row number to delete: "
        read row
        sed -i "$row d" $tableName 
   elif [ "$tableName" = "" ]; 
      then
        echo "Invalid table name ";
  fi
    echo "Done!"
    . ../.././backmenuTable.sh

}
deleteFromTable