#!/bin/bash
insertIntoTable(){
echo -e "Table Name: \c"

read tableName

  if ! [[ -f $tableName ]]; then
    echo "Table $tableName isn't existed ,choose another Table"
    backToMainMenu
fi

colsNum= `awk 'END{print NR}' ./$tableName`
  sep="@"
rSep="\n"
colsNum=2

for (( i = 2; i <= $colsNum; i++ )); do
    colName=$(awk 'BEGIN{FS="@"}{ if(NR=='$i') print $1}' ./$tableName)
    colType=$( awk 'BEGIN{FS="@"}{if(NR=='$i') print $2}' ./$tableName)
#colKey=$( awk 'BEGIN{FS="@"}{if(NR=='$i') print $3}' ./$tableName)
    echo -e "$colName ($colType) = \c"
read data
# Validate Input
    if [[ $colType == "int" ]]; then
      while ! [[ $data =~ ^[0-9]*$ ]]; do
        echo -e "invalid DataType !!"
        echo -e "$colName ($colType) = \c"
        read data
      done
fi
# if [[ $colKey == "PK" ]]; then
#       while [[ true ]]; do
#         if [[ $data =~ ^[`awk 'BEGIN{FS="|" ; ORS=" "}{if(NR != 1)print $(('$i'-1))}' $tableName`]$ ]]; then
#           echo -e "invalid input for Primary Key !!"
#         else
#           break;
#         fi
#         echo -e "$colName ($colType) = \c"
#         read data
#       done
# fi
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
  else
    echo "Error Inserting Data into Table $tableName"
  fi
  row=""
backToMainMenu

}


backToMainMenu(){
    PS3="What Do you want to do ? : ";
    echo "------------------------"
    select varName in "Back to Main menu" "Back to DB Manager"  "Exit"
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

insertIntoTable