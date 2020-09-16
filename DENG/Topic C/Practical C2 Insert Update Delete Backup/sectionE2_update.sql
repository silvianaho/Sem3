/* Check value before the update*/
SELECT * FROM Staff_Relation;

/* decrease permanently the pay of all staff by $50 and increase
permanently the allowance of all staff by 10%. */
UPDATE 
	Staff_Relation
SET
	Pay = Pay - 50,
	Allowance = Allowance * 1.1;

/* Check value after the update*/

SELECT * FROM Staff_Relation;