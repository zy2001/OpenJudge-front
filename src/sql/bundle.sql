CREATE DATABASE openjudge;
USE openjudge;
CREATE TABLE USER(
  ID INT PRIMARY KEY,
  USERNAME VARCHAR(20) UNIQUE,
  PASSWORD VARCHAR(20),
  TOKEN VARCHAR(42),
  GMT_CREATED DATETIME,
  GMT_MODIFIED DATETIME
);

INSERT INTO USER(ID, USERNAME, PASSWORD) VALUES(1, 'zy2000', '123456');

CREATE TABLE PROBLEM(
  PID INT PRIMARY KEY,
  TITLE TEXT,
  DESCRIPTION TEXT,
  DIFF VARCHAR(1),
  INPUT TEXT,
  OUTPUT TEXT,
  AUTHOR VARCHAR(20),
  TIME_LIMIT INT,
  MEMORY_LIMIT INT,
  CASE_COUNT INT,
  ACCEPT INT,
  TOTAL INT,
  GMT_CREATED DATETIME,
  GMT_MODIFIED DATETIME
);

INSERT INTO PROBLEM VALUES(1, 'A + B Problem', 'Calculate A + B.', '1', 'Each line will contain two integers A and B. Process to end of file.', 'For each case, output A + B in one line.', '1', 1000, 65536, 2, 0, 0, NOW(), NOW());
INSERT INTO PROBLEM VALUES(2, 'Sum Problem', 'Hey, welcome to HDOJ(Hangzhou Dianzi University Online Judge).\n\nIn this problem, your task is to calculate SUM(n) = 1 + 2 + 3 + ... + n.', '2', 'The input will consist of a series of integers n, one integer per line.', 'For each case, output SUM(n) in one line, followed by a blank line. You may assume the result will be in the range of 32-bit signed integer.', '1', 1000, 262144, 0, 0, 0, NOW(), NOW());
INSERT INTO PROBLEM VALUES(3, 'A + B Problem II', 'I have a very simple problem for you. Given two integers A and B, your job is to calculate the Sum of A + B.\n', '3', 'The first line of the input contains an integer T(1<=T<=20) which means the number of test cases. Then T lines follow, each line consists of two positive integers, A and B. Notice that the integers are very large, that means you should not process them by using 32-bit integer. You may assume the length of each integer will not exceed 1000.', 'For each test case, you should output two lines. The first line is "Case #:", # means the number of the test case. The second line is the an equation "A + B = Sum", Sum means the result of A + B. Note there are some spaces int the equation. Output a blank line between two test cases.', '1', 1000, 262144, 0, 0, 0, NOW(), NOW());
INSERT INTO PROBLEM VALUES(4, 'Max Sum', 'Given a sequence a[1],a[2],a[3]......a[n], your job is to calculate the max sum of a sub-sequence. For example, given (6,-1,5,4,-7), the max sum in this sequence is 6 + (-1) + 5 + 4 = 14.', '1', 'The first line of the input contains an integer T(1<=T<=20) which means the number of test cases. Then T lines follow, each line starts with a number N(1<=N<=100000), then N integers followed(all the integers are between -1000 and 1000).', 'For each test case, you should output two lines. The first line is "Case #:", # means the number of the test case. The second line contains three integers, the Max Sum in the sequence, the start position of the sub-sequence, the end position of the sub-sequence. If there are more than one result, output the first one. Output a blank line between two cases.', '1', 1000, 262144, 2, 0, 0, NOW(), NOW());
INSERT INTO PROBLEM VALUES(5, 'Shopping', 'Tanechka正在商店里购物。商店里共有n个商品销售，编号为1,2,3…n。恰巧第i个物品的价格是i元。现在，她想买两件商品并且总花费为k元。那么她有多少种选择方案？\n注：选择商品(a,b)和选择商品(b,a)被认为是同一种选择方式。', '1', '一行两个整数n，k(1≤n，k≤10^14)。n代表商品的数量，k代表Tanechka的总花费。', '一行一个整数表示Tanechka可选择的方案数。', 'zy', 1000, 65536, 12, 0, 0, NOW(), NOW());
INSERT INTO PROBLEM VALUES(6, 'Route', 'Mr.Fu的王国中有n个城市，第i个城市的富裕值为a_i。在两个城市间修建一条路的花费是两个城市的富裕值之和。现在国王想修一些路使得所有城市可以相互到达，请计算国王的最小花费。', '1', '第一行一个整数n(1≤n≤10^5)。\n第二行n个整数a_i(0≤a_i≤10^9)。\n', '一行一个正整数表示国王的最小花费。', 'zy', 1000, 65536, 10, 0, 0, NOW(), NOW());


CREATE TABLE SAMPLE(
	PID INT,
	SID INT,
	INPUT TEXT,
	OUTPUT TEXT,
  GMT_CREATED DATETIME,
  GMT_MODIFIED DATETIME,
  PRIMARY KEY(PID, SID)
);

INSERT INTO SAMPLE VALUES (1, 1, '1 1', '2', now(), now());
INSERT INTO SAMPLE VALUES (1, 2, '1 3', '4', now(), now());
INSERT INTO SAMPLE VALUES (2, 1, '1\n100', '1\n\n5050', now(), now());
INSERT INTO SAMPLE VALUES (3, 1, '2\n1 2\n112233445566778899 998877665544332211', 'Case 1:\n1 + 2 = 3\n\nCase 2:\n112233445566778899 + 998877665544332211 = 1111111111111111110', now(), now());
INSERT INTO SAMPLE VALUES (4, 1, '2\n5 6 -1 5 4 -7\n7 0 6 -1 1 -6 7 -5', 'Case 1:\n14 1 4\n\nCase 2:\n7 1 6', now(), now());

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