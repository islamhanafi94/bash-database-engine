backToMainMenu(){
    PS3="What Do you want to do ? : ";
    echo "------------------------"
    select varName in "Back to CRUD Menu" "Back To Main Menu" "Exit"
    do
	case $varName in
		"Back To Main Menu")
			clear;
            cd ../..
            . ./bashdb.sh;
            break;
            ;;
		"Back to CRUD Menu")
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

backToMainMenu