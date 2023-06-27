CREATE VIEW v_oldrich_vesely_project_sql_secondary_final 
SELECT c.country, e.`year`,e.GDP , e.gini , e.taxes , e.population  
FROM countries c 
LEFT JOIN economies e 
	ON c.country = e.country
WHERE e.country IS NOT NULL AND c.continent = 'Europe' AND e.`year` BETWEEN 2006 AND 2018
GROUP BY c.country , e.`year`  
ORDER BY c.country ;


-- výpis evropských zemí, které nejsou v obou tabulkách

SELECT c.country 
FROM countries c 
LEFT JOIN economies e 
    on c.country = e.country 
WHERE e.country is NULL AND c.continent = 'Europe'
ORDER BY c.population desc
;


