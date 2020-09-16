/* Check value before the update*/
SELECT * FROM Staff_Relation;

/* increase permanently by $100 the pay of male full-time staff
who joined before 1996. */
UPDATE 
	Staff_Relation
SET
	Pay = Pay + 100
WHERE
	GENDER = 'M' AND
	Join_Yr < 1996;

/* Check value after the update*/

SELECT * FROM Staff_Relation;