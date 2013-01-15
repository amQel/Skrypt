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
echo "7: Odszyfrowanie pojedynczego pliku tekstowego"
echo "8: Odszyfrowanie wielu plików"
echo "9: Zakończ "
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
	for nplik2 in *.od
		do 
		rm "$nplik2"
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
function odszyfruj
{
  echo "Podaj nazwę pliku"
	read nazwapliku
	if [ -e "$nazwapliku" ]
	then
	{
	cat "$nazwapliku" | tr 'n-za-mN-ZA-M' 'a-zA-Z' 
	} > "$nazwapliku.sd"
	echo "Zaszyfrowano do $nazwapliku.od"
	else 
	echo "Brak pliku $nazwapliku"
	fi
}
function odszyfruj_wiele
{
	for nazwyplikow in *
		do
		echo "Szyfrować plik $nazwyplikow ?[0/1]" 
		read answer
		
		if [ $answer -eq "1" ]
		then
		{
		cat "$nazwyplikow" | tr 'n-za-mN-ZA-M' 'a-zA-Z' 
		} > "$nazwyplikow.od"
		
		fi
		
		done
}
opcje
d=10;

until [ "$d" -eq 9 ]; do 
read d
	case "$d" in
	
	"1") opcje ;;
	"2") tree ;;
	"3") szyfruj ;;
	"4") szyfruj_wiele ;;
	"5") wyswietl ;;
	"6") usun ;;
	"7") odszyfruj ;;
	"8") odszyfruj_wiele ;;	
	"9") echo "Kończę skrypt..." ;;
      *) echo "Nic nie wybrałeś" ;;
    
	esac

done 
exit 0
