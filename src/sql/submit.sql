CREATE TABLE SUBMIT(
  RID INT PRIMARY KEY AUTO_INCREMENT,
  PID INT,
  UID INT,
  CODE TEXT,
  LANGUAGE VARCHAR(10),
  STATUS INT,
  RUN_TIME INT,
  RUN_MEMORY INT,
  COMPILATION_MESSAGE TEXT,
  GMT_CREATED DATETIME,
  GMT_MODIFIED DATETIME,
  CONSTRAINT FOREIGN KEY (PID) REFERENCES PROBLEM(PID),
  CONSTRAINT FOREIGN KEY (UID) REFERENCES USER(ID)
);

INSERT INTO SUBMIT (RID, PID, UID, CODE, LANGUAGE, STATUS, GMT_CREATED, GMT_MODIFIED) VALUES (1, 1, 1,'#include <stdio.h>\nusing namespace std;\nint main()\n{\n	int a, b;\n	while (~scanf("%d %d", &a, &b)) {\n		printf("%d\\n", a + b);\n	}\n	return 0;\n}','C++',0,NOW(),NOW());
INSERT INTO SUBMIT (RID, PID, UID, CODE, LANGUAGE, STATUS, GMT_CREATED, GMT_MODIFIED) VALUES (2, 1, 1,'#include <bits/stdc++.h>\n\nint main()\n{\n    int a, b;\n    while(~scanf("%d %d", &a, &b)) {\n        printf("%d\\n", a + b);}\n    return 0;\n}','C++',0,NOW(),NOW());