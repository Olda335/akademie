# akademie
Projekt datové akademie

Cílem projektu je připravit datové podklady, na základě kterých je možné zodpovědět několik otázek.
První úkol je propojení tabulek s údaji o mzdách a cenách v ČR.
Údaje je nutné spojit za odpovídající období, kterým je rok. Méně údajů je v tabulce o cenách, její rozsah určuje sledované období, což jsou roky 
2008 - 2016.
Zajímají nás pouze souhrnné údaje za celou ČR.
Mzdy jsou v ročním členění za jednotlivé obory, ceny za jednotlivé položky spotřebního koše.
K tabulce mzdy je připojena tabulka obsahující název oboru a k tabulce ceny je připojena ještě tabulka
kategorie cen, které obsahuje údaje o tom v jakých jednotkách je cena uváděna a jaké je základní množství.
Tabulka je vytvořena dotazem primar_table.sql a slouží jako podklad pro další dotazy.

## Otázka č.1
Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
Pro hledání odpovědi na tuto otázku jsem nejprve vytvořil pomocnou tabulku, která
počítá meziroční procentní změny mezd pro jednotlivé obory.
Druhý dotaz zobrazuje pouze obory, ve kterých někdy byl pokles mezd.
A výsledkem třetího je seznam pěti oborů, které ve sledovaném období nikdy nevykázaly pokles průměrné mzdy

## Otázka č.2
Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd
Pro zodpovězení této otázky bylo nutné určit průměrnou roční mzdu za všechny obory a tu pak následně vydělit 
cenou sledovaných komodit.
V roce 2006 bylo možné koupit 1261 kg chleba a 1409 l mléka.
V roce 2018 bylo možné koupit 1319 kg chleba a 1613 l mléka.

## Otázka č.3
Která kategorie potravin zdražuje nejpomaleji?
Pro zodpovězení této otázky jsem pro každou potravinu spočítal průměrnou procentní změnu ceny.
Rozdíl ceny na začátku a konci sledovaného období dělenou počtem období.
Nejpomaleji zdražuje cukr, u kterého ve sledovaném období dokonce došlo k poklesu ceny o 2,29 %.
K tomuto tématu jsem ještě vytvořil jeden dotaz, který ukazuje meziroční změny všech potravin za jednotlivé roky.

## Otázka č.4
Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
Pro odpověď na otázku jsem agregoval ceny všech potravin v daném roce do jedné položky, vytvořil jsem jakýsi spotřební koš,
u tohoto koše jsem pak vyhodnotil meziroční změny a ty pak porovnal s meziročními změnami mezd, které opět byly za všechny obory.
Nejvýraznější rozdíl v pohybu mezd a cen je mezi roky 2008 a 2009, kdy ceny o 8,2 % klesly, zatímco mzdy o 3,11 % vyrostly.

## Otázka č.5
5.	Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce,
projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

Nejprve bylo nutné vytvořit dotaz, který spočítá meziroční změny GDP pro ČR a ty porovná s růstem mezd a cen.
Jako zdroj dat pro GDP byla použita zdrojová tabulka economies.


Posledním úkolem bylo vytvoření tabulky, která propojí tabulky countries a economies za sledované období pro 
evropské země. K dotazu, který tuto tabulku vytvoří jsem ještě připojil dotaz, který zobrazuje evropské země, které jsou v tabulce countries a nejsou v tabulce economies.


