dropTable() {
    clear;
    echo -n "Enter Table Name: "
    read tableName

    if [[ -f $tableName ]]; 
      then
        rm $tableName  .${tableName}MetaData
            if [[ $? == 0 ]]
                then
                    echo "$tableName Removed Successfully!";
            else
                    echo "Error Dropping Table $tableName"
    fi


   else 
        echo "$tableName Doesn't exist!";
        
  fi


    . ../.././backmenuTable.sh
}

dropTable