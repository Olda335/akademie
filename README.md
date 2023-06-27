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

## Otázka č.4


