SELECT	deposit_group
FROM	
	(
		SELECT deposit_group, AVG(magic_wand_size) AS averaged_wands
		FROM wizzard_deposits 
		GROUP BY deposit_group
	) AS avg_wand_sizes
WHERE	averaged_wands = (SELECT MIN(averaged_wands) FROM	(
								SELECT deposit_group, AVG(magic_wand_size) AS averaged_wands
								FROM wizzard_deposits 
								GROUP BY deposit_group
							) AS min_wand_size
						 )