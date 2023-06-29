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
### Vstupní data:
1.	czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
2.	czechia_payroll_calculation – Číselník kalkulací v tabulce mezd.
3.	czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.
4.	czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.
5.	czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.
6.	czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
7.	czechia_price_category – Číselník kategorií potravin, které se vyskytují v našem přehledu

Pro tvorbu sekundární tabulky pak:
1.	countries - Všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.
2.	economies - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.


## Otázka č.1
Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
Pro hledání odpovědi na tuto otázku jsem nejprve vytvořil pomocnou tabulku, která
počítá meziroční procentní změny mezd pro jednotlivé obory.
Druhý dotaz zobrazuje pouze obory, ve kterých někdy byl pokles mezd.
A výsledkem třetího je seznam pěti oborů, které ve sledovaném období nikdy nevykázaly pokles průměrné mzdy.
Odpověď tedy je, že je pouze pět oborů, ve kterých nedošlo meziročně v rámci sledovaného období k poklesu mezd.
Největší meziroční nárůst byl v oboru těžba a dobývání mezi roky 2007-2008 a to 13,87 %.
Naopak největší pokles zaznamenal obor peněžnictví a pojišťovnictví mezi roky 2012-2013 a to 9 %.

## Otázka č.2
Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd
Pro zodpovězení této otázky bylo nutné určit průměrnou roční mzdu za všechny obory a tu pak následně vydělit 
cenou sledovaných komodit.
V roce 2006 bylo možné koupit 1261 kg chleba a 1409 l mléka.
V roce 2018 bylo možné koupit 1319 kg chleba a 1613 l mléka.
U obou položek se množství, které lze koupit z průměrné mzdy zvětšuje. Mzdy tedy rostou rychleji než cena sledovaných položek.

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
Mzdy kromě poklesu mezi roky 2012-2013 rostou každoročně bez ohledu na vývoj GDP.
Naopak ceny klesají i při rostoucím GDP, viz období 2013-2016.

### Tvorba sekundární tabulky
Posledním úkolem bylo vytvoření tabulky, která propojí tabulky countries a economies za sledované období pro 
evropské země. K dotazu, který tuto tabulku vytvoří jsem ještě připojil dotaz, který zobrazuje evropské země, které jsou v tabulce countries a nejsou v tabulce economies.


