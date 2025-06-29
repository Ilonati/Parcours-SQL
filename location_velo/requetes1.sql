SELECT * FROM velo
WHERE disponible = TRUE;

SELECT * FROM location
WHERE id_client = 1;

SELECT COUNT(*) AS total_locations FROM location;

SELECT SUM(montant_total) AS revenus_totaux FROM location;

SELECT id_velo,
COUNT(*) AS total_locations
FROM location
GROUP BY id_velo
ORDER BY total_locations DESC;