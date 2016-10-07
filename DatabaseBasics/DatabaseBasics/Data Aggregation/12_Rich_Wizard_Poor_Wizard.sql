SELECT	SUM(battle.diff)
FROM	(SELECT deposit_amount - (SELECT deposit_amount 
									FROM wizzard_deposits 
									WHERE  id = current_wizzard.id + 1)
									AS diff
		FROM wizzard_deposits current_wizzard)
		AS battle
		