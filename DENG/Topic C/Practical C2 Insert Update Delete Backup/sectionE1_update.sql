/* Check value before the update*/
SELECT * FROM Staff_Relation;

/* increase permanently the pay of all staff by 5% */
UPDATE 
	Staff_Relation
SET
	Pay = Pay * 1.05;

/* Check value after the update*/

SELECT * FROM Staff_Relation;