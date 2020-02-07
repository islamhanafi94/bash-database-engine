
insertFunc(){
   clear
   echo  "******** Insert Into Table ********"
   echo  "------------------------------"
   echo -n "Tabel name : ";
   read tableName ;

   # Validating table name 
   if ![[ -f $tableName ]]; 
      then
         echo "Table $tableName not Found ";
         backToMainMenu;

   elif [ "$tableName" = "" ]; 
      then
         echo "Table name can't be null";
         backToMainMenu;
  fi
   clear;
   insertInTable
   
}



backToMainMenu(){
    PS3="What Do you want to do ? : ";
    echo "------------------------"
    select varName in "Back to Main menu" "Back to DB Manager" "Exit"
    do
	case $varName in
		"Back to menu")
            clear;
            . ../.././bashdb.sh
            break;
            ;;
		"Back to DB Manager")
            clear;
            . ../.././crud.sh;
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

insertInTable()
{
    #echo -n "Enter Table Name: ";
    #read tableName;
     metafile=.${tableName}MetaData
     #echo $metafile
    echo "Enter your Data"
    colsNum=$(cat ./.${tableName}MetaData| wc -l)
    
    #echo $colsNum
    
      sep="@"
      rSep="\n"
    for (( i = 2; i <= $colsNum; i++ )); do
    colName=$(awk 'BEGIN{FS="@"}{ if(NR=='$i') print $1}' ./.${tableName}MetaData)
    colType=$( awk 'BEGIN{FS="@"}{if(NR=='$i') print $2}' ./.${tableName}MetaData)
    echo -e "$colName ($colType) ---->"
    read data

    # Validate Input
    if [[ $colType == "int" ]]; then
      while ! [[ $data =~ ^[0-9]*$ ]]; do
        echo -e "invalid DataType !!"
        echo -e "$colName $colType = \c"
        read data
      done
    fi

    #if [[ $colKey == "PK" ]]; then
      while [[ true ]]; do
        if [[ $data =~ ^[`awk 'BEGIN{FS="@" ; ORS=" "}{if(NR != 1)print $(('$i'-1))}' $tableName`]$ ]]; then
          echo -e "invalid input !!"
        else
          break;
        fi
        echo -e "$colName $colType = \c"
        read data
      done
    #fi

    #Set row
    if [[ $i == $colsNum ]]; then
      row=$row$data$rSep
    else
      row=$row$data$sep
    fi
  done
  echo -e $row"\c" >> $tableName
  if [[ $? == 0 ]]
  then
    echo "Data Inserted Successfully"
    
    . ../.././crud.sh
  else
    echo "Error Inserting Data into Table $tableName"
    . ../.././crud.sh
  fi
  row=""


}
insertFunc