-- otázka č.1 míra poklesu mezd ve sledované období

-- pomocná tabulka se zobrazením meziročních změn mezd

CREATE VIEW v_growth_payroll AS 
SELECT vodp.year_payroll AS actual_year , vodp.payroll AS actual, vodp2.payroll AS prev ,vodp2.year_payroll AS year_prev, vodp.branch  ,
round((vodp.payroll - vodp2.payroll)/vodp2.payroll*100,2) AS growth_percent
FROM v_oldrich_vesely_project_sql_primary_final vodp 
JOIN v_oldrich_vesely_project_sql_primary_final vodp2 
	ON vodp.year_payroll = vodp2.year_payroll + 1
	AND vodp.code_branch = vodp2.code_branch 
GROUP BY vodp.year_payroll, vodp.code_branch 
ORDER BY growth_percent;

-- výběr odvětví, ve kterých byl někdy pokles mezd

SELECT DISTINCT branch
FROM v_growth_payroll vgp 
WHERE growth_percent < 0

-- výběr odvětví, které nikdy neměly pokles mezd 

SELECT DISTINCT branch
FROM v_growth_payroll vgp 
WHERE branch NOT IN (
SELECT DISTINCT branch
FROM v_growth_payroll vgp 
WHERE growth_percent < 0);


-- otázka č.2 nákup kg chleba a litry mléka v první a posledním sledovaném období


SELECT vodp.price, vodp.item, vodp.year_price , round(avg(vodp.payroll ),2) AS salary , round(avg(vodp.payroll)/vodp.price,2) AS quantity, vodp.unit
FROM v_oldrich_vesely_project_sql_primary_final vodp
WHERE vodp.item IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
AND vodp.year_price IN (2006,2018)
GROUP BY vodp.item, vodp.year_price;



-- otázka č.3 průměrná % změna ceny za sledované období - ((průměrná cena v posledním sledovaném roce - průměrná cena v prvním sledovaném roce)/počet období)
-- to celé vztažené k ceně v prvním období, převedené na %

SELECT ROUND((last_year.last_price - first_year.first_price)/(last_year.end_year - first_year.start_year)/first_year.first_price*100,3) AS diff, 
	last_year.item
FROM
	(SELECT ROUND(AVG(vodp.price),2) AS last_price , vodp.item AS item, vodp.year_price AS end_year
	FROM v_oldrich_vesely_project_sql_primary_final vodp 
	WHERE vodp.year_price IN(
		SELECT max(vodp.year_price)
		FROM v_oldrich_vesely_project_sql_primary_final vodp )
		GROUP BY vodp.item) last_year
JOIN 	
	(SELECT ROUND(AVG(vodp.price),2) AS first_price, vodp.item  , vodp.year_price AS start_year
	FROM v_oldrich_vesely_project_sql_primary_final vodp 
	WHERE vodp.year_price IN(
		SELECT min(vodp.year_price)
		FROM v_oldrich_vesely_project_sql_primary_final vodp)
		GROUP BY vodp.item) first_year
ON last_year.item = first_year.item
ORDER BY diff ;


-- otázka č.4 porovnání růstu cen potravin a růstu mezd

SELECT vgp.actual_year AS comparsion_year, round(avg(vgp2.growth_percent),2) AS price_growth, round(avg(vgp.growth_percent),2) AS salary_growth, 
round(avg(vgp2.growth_percent)-avg(vgp.growth_percent),4) AS difference
FROM v_growth_payroll vgp 
JOIN v_growth_prices vgp2 
	ON vgp.actual_year = vgp2.actual_year 
GROUP BY vgp.actual_year 


-- úkol 5 porovnání růstu GDP a mezd a cen

SELECT round(e.GDP,0) AS GDP, round(e2.GDP,0) AS GDP2, e.country , e.`year` , e2.`year` , 
round(avg(vgp.growth_percent),2) AS salary_growth, 
round(avg(vgp2.growth_percent),2) AS price_growth,
round((e.GDP-e2.GDP)/e2.GDP *100,2) AS GDP_growth
FROM economies e
JOIN v_growth_payroll vgp 
	ON e.`year` =  vgp.actual_year
JOIN v_growth_prices vgp2 
	ON e.`year` = vgp2.actual_year 
JOIN economies e2 
	ON e.`year` = e2.`year` + 1
	AND e.country = e2.country 
WHERE e.country = 'Czech republic' AND e.`year` BETWEEN 2007 AND 2019
GROUP BY vgp.actual_year 
	
	
