#! /bin/sh





AddRecord(){
		echo ""
		echo "		First Name: "
		echo "		 Last Name: "
		echo "		   Address: " 
		echo "		      City: " 
		echo "		     State: " 
		echo "		       ZIP: "
		echo "		 Telephone: " 
		echo "		Class Rank: "
		
		
		tput cup 9 27
		read fName
		
		tput cup 10 27
		read lName
		
		tput cup 11 27
		read addr
		
		tput cup 12 27
		read city
		
		tput cup 13 27
		read state
		
		tput cup 14 27
		read zip
		
		tput cup 15 27
		read telNum
		
		tput cup 16 27
		read rank 
		
		
		echo "$fName:$lName:$addr:$city:$state:$zip:$telNum:$rank" >> output.txt
	
	return 0

}

Search(){
	if [ -e "output.txt" ]
	then
		echo "			    Enter the last name to search for: "
		tput cup 8 63
		read name
		echo " + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +"
		cat output.txt | awk -F: -v target=${name} '{ if ( target==$2 ) printf("+ %-9s + %-11s + %-21s + %-9s + %-11s + %-9s + %-13s + %-5s +\n", $1,$2,$3,$4,$5,$6,$7,$8) }'
		echo " + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +"
	else
		echo "Contacts List is empty!"
	fi
		
	echo ""
	echo "				    Press any key to return to the menu."
	read -n 1 -s
}

List(){

	if [ -e "output.txt" ]
	then
		lines=$(cat output.txt | wc -l)
		lines=`expr $lines +  7`
		echo "                                                   + + + + +"
		echo "                                                   +Records+                                                "
		echo " + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +"
		awk -F: '{ printf(" + %-9s + %-11s + %-21s + %-9s + %-11s + %-9s + %-13s + %-5s +\n", $1,$2,$3,$4,$5,$6,$7,$8) }' output.txt
		echo " + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +"

	else
		echo "Contact List is Empty!"
	fi
	
	echo ""
	echo "				    Press any key to return to the menu."
	read -n 1 -s
	
	
	return 0

}




menuNum=0

while [ $menuNum -ne 4 ]
do
	clear
	echo "					    Contact List Menu"
	echo ""
	echo "						1.) Add a Record"
	echo "						2.) Search by last name"
	echo "						3.) List all records"
	echo "						4.) Exit Menu"
	echo ""
	echo "					    Enter a Selection: "
	tput cup 7 63
	read menuNum
	
	
	
	
	
	case $menuNum in
			1) AddRecord ;;
			2) Search ;;
			3) List ;;
			4) exit ;;
			+ ) echo "You did not enter 1-4" ;;
	esac
done

