createTable(){
   clear
   echo  "******** Create Table ********"
   echo  "------------------------------"
   echo -n "Tabel name : ";
   read tableName ;

   # Validating table name 
   if [[ -f $tableName ]]; 
      then
         echo "Already Exists!";
         backToMainMenu;

   elif [ "$tableName" = "" ]; 
      then
         echo "Table name can't be null";
         backToMainMenu;
  fi
   clear;
   tabelMetaData;
}

backToMainMenu(){
    PS3="What Do you want to do ? : ";
    echo "------------------------"
    select varName in "Back to Main menu" "Back to DB Manager" "Create Table" "Exit"
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
		"Create Table")
            clear;
            createTable;
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

tabelMetaData(){
  echo -n "Number of Columns: "
  read colNumber
  counter=1
  sep="@"
  rSep="\n"
  pKey=""
  metaData="column"$sep"dataType"

  while [ $counter -le $colNumber ]
  do
    echo -n "Name of Column No.$counter: "
    read colName

    echo "-------------------------"
    echo "Type of Column $colName: "
     PS3=">:"
    select var in "int" "string"
    do
      case $var in
        int) 
            colType="int";
            break;;
        string) 
            colType="string";
            break;;
        *) echo "Invalid" ;;
      esac
    done

   metaData+=$rSep$colName$sep$colType

   if [[ $counter == $colNumber ]]; 
      then
         temp=$temp$colName
   else
         temp=$temp$colName$sep
   fi

   ((counter++))
  done

   touch $tableName;
   touch .${tableName}MetaData
   echo -e $metaData >> .${tableName}MetaData
   echo -e $temp >> $tableName
   echo $MetaData
   if [[ $? == 0 ]]
      then
         clear;
         echo "Table ($tableName) created successfully!"; 
         . ../.././crud.sh
   else
         echo "Error Creating Table $tableName"
         . ../.././crud.sh
   fi
}

createTable