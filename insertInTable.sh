insertInTable()
{
    echo -n "Enter Table Name: ";
    read tableName;
    #Col -----> sed to get umber of fields
    declare -a fieldsNames[$Col]    #we want to know the number of fields
    declare -a fieldsDatatypes[$Col]
    if test -f "$tableName"
    then
        # sed , cut and get the fields name and save in "fieldsNames"
        # sed , cut and  get the fields datatype and save in "ieldsDatatypes"

        # loop with number of fields "Col" and 2 arrays
        # read the data from user and write in file

    else
        clear ; 
        echo "$tableName Table Not found !!" 
        . ../.././backmenuTable.sh
          
    fi    


}
insertInTable