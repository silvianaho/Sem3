ALTER TABLE Course_Relation ADD FOREIGN KEY (Offered_by) REFERENCES Department_Relation(Dept_Cd);
ALTER TABLE Department_relation ADD FOREIGN KEY (HOD) REFERENCES Staff_relation(Staff_No);
ALTER TABLE Staff_relation ADD FOREIGN KEY (Dept_Cd) REFERENCES Department_relation(Dept_Cd);