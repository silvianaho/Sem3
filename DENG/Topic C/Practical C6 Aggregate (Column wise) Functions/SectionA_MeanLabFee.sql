SELECT
	AVG(Lab_Fee) 'Mean Lab Fee',
	AVG(ISNULL(Lab_Fee, 0)) 'Mean Lab Fee – Null treated as zero'
FROM
	Course_Relation;