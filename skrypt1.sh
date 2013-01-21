#!/bin/bash
function szyfruj
{
  echo "Podaj nazwę pliku"
	read nazwapliku
	if [ -e "$nazwapliku" ]
	then
		plik=`basename "$nazwapliku" .od`
			if [ "$nazwapliku" == "$plik" ]
			then
				plik="$nazwapliku"
			else
				mv "$nazwapliku" "$plik"
			fi
	{
	cat "$plik" | tr 'a-zA-Z' 'n-za-mN-ZA-M'
	} > "$plik.sd"
	echo "Zaszyfrowano do $plik.sd"
	rm "$plik"
	else 
	echo "Brak pliku $nazwapliku"
	fi
}
function wyswietl
{
	echo "Podaj nazwę pliku"
	read nazwa
	cat "$nazwa"	
}
function usun
{
	for nplik in *.sd
		do 
		if [ -e "$nplik" ]
		then
		rm "$nplik"
		fi
		done
	for nplik2 in *.od
		do 
		if [ -e "$nplik2" ]
		then
		rm "$nplik2"
		fi
		done
}
function szyfruj_wiele
{
	for nazwyplikow in *
		do
		echo "Szyfrować plik $nazwyplikow ?[0/1]" 
		read answer
		
		if [ $answer -eq "1" ]
		then
		plik=`basename "$nazwyplikow" .od`
			if [ "$nazwyplikow" == "$plik" ]
			then
				plik="$nazwyplikow"
			else
				mv "$nazwyplikow" "$plik"
			fi
	{
	cat "$plik" | tr 'a-zA-Z' 'n-za-mN-ZA-M'
	} > "$plik.sd"
	echo "Zaszyfrowano do $plik.sd"
	rm "$plik"
		fi
		
		done
}
function odszyfruj
{
  echo "Podaj nazwę pliku"
	read nazwapliku
	if [ -e "$nazwapliku" ]
	then
		plik=`basename "$nazwapliku" .sd`
			if [ "$nazwapliku" == "$plik" ]
			then
				plik="$nazwapliku"
			else
				mv "$nazwapliku" "$plik"
			fi
	{
	cat "$plik" | tr 'n-za-mN-ZA-M' 'a-zA-Z' 
	} > "$plik.od"
	echo "Odszyfrowano do $plik.od"
	rm "$plik"
	else 
	echo "Brak pliku $nazwapliku"
	fi
}
function odszyfruj_wiele
{
	for nazwapliku in *.sd
		do
		echo "Odszyfrować plik $nazwapliku ?[0/1]" 
		read answer
		
		if [ $answer -eq "1" ]
		then
		plik=`basename "$nazwapliku" .sd`
			if [ "$nazwapliku" == "$plik" ]
			then
				plik="$nazwapliku"
			else
				mv "$nazwapliku" "$plik"
			fi
	{
	cat "$plik" | tr 'n-za-mN-ZA-M' 'a-zA-Z' 
	} > "$plik.od"
	echo "Odszyfrowano do $plik.od"
	rm "$plik"
		fi
		
		done
}

echo "Co chcesz zrobić z plikami?"
	select x in "Pokaż Drzewko" "Szyfruj" "Szyfruj Wiele" "Wyświetl plik" "Usuń Wszystkie pliki stworzone przez ten program" "Odszyfruj" "Odszyfruj wiele" "Zakończ"
do
  case $x in
	"Pokaż Drzewko") tree ;;
	"Szyfruj") szyfruj ;;
	"Szyfruj Wiele") szyfruj_wiele ;;
	"Wyświetl plik") wyswietl ;;
	"Usuń Wszystkie pliki stworzone przez ten program") usun ;;
	"Odszyfruj") odszyfruj ;;
	"Odszyfruj wiele") odszyfruj_wiele ;;	
	"Zakończ") echo "Kończę skrypt... Have a nice day."; break ;;
      *) echo "Nic nie wybrałeś" ;;
  esac
done

exit 0
