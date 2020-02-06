backToMainMenu(){
    PS3="What Do you want to do ? : ";
    echo "------------------------"
    select varName in "Back to menu" "Exit"
    do
	case $varName in
		"Back to menu")
			clear;
            . ./bashdb.sh;
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