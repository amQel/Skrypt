#!/bin/bash
function opcje
{
echo "Lista opcji do wyboru"
echo "1: Pokaż listę opcje"
echo "2: Pokaż drzewko"
echo "3: Szyfrowanie pojedynczego pliku tekstowego"
echo "4: Szyfrowanie wielu plików"
echo "5: Zobacz zawartość pliku"
echo "6: Usuń wszystkie pliki utworzone przez ten program"
echo "7: Zakończ "
}
function szyfruj
{
  echo "Podaj nazwę pliku"
	read nazwapliku
	if [ -e "$nazwapliku" ]
	then
	{
	cat "$nazwapliku" | tr 'a-zA-Z' 'n-za-mN-ZA-M'
	} > "$nazwapliku.sd"
	echo "Zaszyfrowano do $nazwapliku.sd"
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
		rm "$nplik"
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
		{
		cat "$nazwyplikow" | tr 'a-zA-Z' 'n-za-mN-ZA-M'
		} > "$nazwyplikow.sd"
		
		fi
		
		done
}
opcje
d=10;

until [ "$d" -eq 7 ]; do 
read d
	case "$d" in
	
	"1") opcje ;;
	"2") tree ;;
	"3") szyfruj ;;
	"4") szyfruj_wiele ;;
	"5") wyswietl ;;
	"6") usun ;;
	"7") echo "Kończę skrypt..." ;;
      *) echo "Nic nie wybrałeś" ;;
    
	esac

done 
exit 0
