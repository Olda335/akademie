CREATE VIEW v_oldrich_vesely_project_SQL_primary_final AS 
SELECT 
prices.item, prices.year_price,prices.price,prices.quantity, prices.unit, 
payrolls.year_payroll, payrolls.payroll, payrolls.branch, payrolls.code_branch 
FROM  
	(SELECT year(cp.date_from) AS year_price, avg(cp.value) AS price, cpc.name AS item, cpc.price_value AS quantity, cpc.price_unit AS unit 
	FROM czechia_price cp 
	JOIN czechia_price_category cpc 
		ON cp.category_code = cpc.code 
		AND cp.region_code IS NULL 
	GROUP BY year_price, cpc.name
	) AS prices
JOIN 
	(SELECT cp.payroll_year AS year_payroll, avg(cp.value) AS payroll, cpib.name AS branch, cp.industry_branch_code AS code_branch
	FROM czechia_payroll cp
	JOIN czechia_payroll_industry_branch cpib 
		ON cp.industry_branch_code = cpib.code
		WHERE cp.value IS NOT NULL AND cp.calculation_code = 100 AND cp.value_type_code = 5958 
	GROUP BY cp.payroll_year , branch
	) AS payrolls
ON prices.year_price = payrolls.year_payroll;