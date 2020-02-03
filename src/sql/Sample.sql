CREATE TABLE SAMPLE(
	PID INT,
	SID INT,
	INPUT TEXT,
	OUTPUT TEXT,
  GMT_CREATED DATE,
  GMT_MODIFIED DATE,
  PRIMARY KEY(PID, SID)
);

INSERT INTO SAMPLE VALUES (1, 1, '1 1', '2', now(), now());
INSERT INTO SAMPLE VALUES (1, 2, '1 3', '4', now(), now());
INSERT INTO SAMPLE VALUES (2, 1, '1\n100', '1\n\n5050', now(), now());
INSERT INTO SAMPLE VALUES (3, 1, '2\n1 2\n112233445566778899 998877665544332211', 'Case 1:\n1 + 2 = 3\n\nCase 2:\n112233445566778899 + 998877665544332211 = 1111111111111111110', now(), now());
INSERT INTO SAMPLE VALUES (4, 1, '2\n5 6 -1 5 4 -7\n7 0 6 -1 1 -6 7 -5', 'Case 1:\n14 1 4\n\nCase 2:\n7 1 6', now(), now());
