CREATE DATABASE openjudge;
USE openjudge;
CREATE TABLE USER(
  ID INT PRIMARY KEY AUTO_INCREMENT,
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
INSERT INTO PROBLEM VALUES(2, '取数', 'Satori给你一个n×m的网格，每个格子内有一个数。现在按照从上到下，从左到右的顺序给网格编号，编号为1…n×m，现在从第一行开始，取最大的数，然后取次大的数（若两个数大小相同，先取编号小的数），以此类推直到取完此行，然后再取下一行的数，直到取完最后一行。现要求输出每一行取的数的编号。', '1', '第一行两个正整数n, m。\n接下来n行，每行m个正整数a_i_j(1<=a_i_j<=10^9)。', '输出共n行，每行m个正整数表示第当前取的数的编号。', '李泉志', 1000, 262144, 5, 0, 0, NOW(), NOW());
INSERT INTO PROBLEM VALUES(3, '走路', 'Koishi给你一个n×m的网格图，起点为左上角，坐标为(1,1)。你需要从起点开始向右方走直到走到边界，再向下走直到走到边界，再向上走走到边界，不能走已走过的格子。请你输出走K步之后的坐标。', '1', '一行三个整数n, m, K(1<=n,m<=100, 0<=K<n×m)。', '一行两个正整数表示从起点按要求走 步之后的坐标。', '李泉志', 1000, 262144, 10, 0, 0, NOW(), NOW());
INSERT INTO PROBLEM VALUES(4, 'Good Number', 'Rumia给你一个正整数n，求区间[1,n]中有多少种符合条件的整数。\n条件为：该数字的各个位上的数字均相同。（例如1, 7, 66, 111, 2222, 88888等）。', '2', '一个正整数n(1<=n<=10^9)', '输出一个正整数，表示符合条件的数字数量。', '李泉志', 1000, 262144, 10, 0, 0, NOW(), NOW());
INSERT INTO PROBLEM VALUES(5, 'Shopping', 'Tanechka正在商店里购物。商店里共有n个商品销售，编号为1,2,3…n。恰巧第i个物品的价格是i元。现在，她想买两件商品并且总花费为k元。那么她有多少种选择方案？\n注：选择商品(a,b)和选择商品(b,a)被认为是同一种选择方式。', '1', '一行两个整数n，k(1≤n，k≤10^14)。n代表商品的数量，k代表Tanechka的总花费。', '一行一个整数表示Tanechka可选择的方案数。', '赵宇', 1000, 65536, 12, 0, 0, NOW(), NOW());
INSERT INTO PROBLEM VALUES(6, 'Route', 'Mr.Fu的王国中有n个城市，第i个城市的富裕值为a_i。在两个城市间修建一条路的花费是两个城市的富裕值之和。现在国王想修一些路使得所有城市可以相互到达，请计算国王的最小花费。', '1', '第一行一个整数n(1≤n≤10^5)。\n第二行n个整数a_i(0≤a_i≤10^9)。\n', '一行一个正整数表示国王的最小花费。', '赵宇', 1000, 65536, 10, 0, 0, NOW(), NOW());
INSERT INTO PROBLEM VALUES(7, '过六级', '六级考试听力中的关键词又多又长，Vasaya不能把所有听到的关键词都写出来，他的六级考试又挂了。为了通过考试，Vasaya决定用单词缩写记法，把一个单词中的英文字母的a,e,i,y,o,u字母省略，如"subconscious"缩写为"sbcnscs"。但是，如果一个单词的首字母是a,e,i,y,o,u中的一个，那么不能被省略，如"apple"缩写为"appl"。现在有n个英文单词，Vasaya想让你帮他写出每个单词的缩写形式。', '1', '第一行一个整数n(1≤n≤100)。代表单词的个数.\n接下来n行每行一个单词s(1≤|s|≤100)。', '共n行，第i行是第i个单词的缩写。', '赵宇', 1000, 262144, 12, 0, 0, NOW(), NOW());

CREATE TABLE SAMPLE(
	PID INT,
	SID INT,
	INPUT TEXT,
	OUTPUT TEXT,
  GMT_CREATED DATETIME,
  GMT_MODIFIED DATETIME,
  PRIMARY KEY(PID, SID)
);

INSERT INTO SAMPLE VALUES (1, 1, '1 1', '2', NOW(), NOW());
INSERT INTO SAMPLE VALUES (1, 2, '1 3', '4', NOW(), NOW());
INSERT INTO SAMPLE VALUES (2, 1, '3 3\n1 4 3\n6 4 2\n5 9 9', '2 3 1\n4 5 6\n8 9 7', NOW(), NOW());
INSERT INTO SAMPLE VALUES (3, 1, '4 5 16', '2 4', NOW(), NOW());
INSERT INTO SAMPLE VALUES (4, 1, '18', '10', NOW(), NOW());
INSERT INTO SAMPLE VALUES (5, 1, '8 15', '1', NOW(), NOW());
INSERT INTO SAMPLE VALUES (5, 2, '8 5', '2', NOW(), NOW());
INSERT INTO SAMPLE VALUES (5, 3, '1 5', '0', NOW(), NOW());
INSERT INTO SAMPLE VALUES (6, 1, '4\n1 1 1 1', '6', NOW(), NOW());
INSERT INTO SAMPLE VALUES (6, 2, '1\n1', '0', NOW(), NOW());
INSERT INTO SAMPLE VALUES (7, 1, '5\nsubconscious\noipotato\nword\nsymbol\napple', 'sbcnscs\noptt\nwrd\nsmbl\nappl', NOW(), NOW());


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