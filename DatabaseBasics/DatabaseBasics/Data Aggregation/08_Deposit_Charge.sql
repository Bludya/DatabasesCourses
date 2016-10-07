SELECT	deposit_group, magic_wand_creator, MIN(deposit_charge) as min_deposit
FROM	wizzard_deposits
GROUP	BY	deposit_group, magic_wand_creator 
ORDER BY magic_wand_creator, deposit_group ASC
