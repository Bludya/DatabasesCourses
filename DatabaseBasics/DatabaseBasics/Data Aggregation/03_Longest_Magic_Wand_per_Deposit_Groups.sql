SELECT deposit_group, MAX(magic_wand_size) AS longest_magic_land
FROM wizzard_deposits
GROUP BY deposit_group