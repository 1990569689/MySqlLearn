/*
CREATE DATABASE 数据库名;
创建数据库
DROP DATABASE 数据库名;
删除数据库
DROP TABLE 数据表名;
删除数据表
MySQL 中定义数据字段的类型对你数据库的优化是非常重要的。

MySQL 支持多种类型，大致可以分为三类：数值、日期/时间和字符串(字符)类型。
*/

/*
数值类型
MySQL 支持所有标准 SQL 数值数据类型。

这些类型包括严格数值数据类型(INTEGER、SMALLINT、DECIMAL 和 NUMERIC)，以及近似数值数据类型(FLOAT、REAL 和 DOUBLE PRECISION)。

关键字INT是INTEGER的同义词，关键字DEC是DECIMAL的同义词。

BIT数据类型保存位字段值，并且支持 MyISAM、MEMORY、InnoDB 和 BDB表。

作为 SQL 标准的扩展，MySQL 也支持整数类型 TINYINT、MEDIUMINT 和 BIGINT。下面的表显示了需要的每个整数类型的存储和范围。

类型	大小	范围（有符号）	范围（无符号）	用途
TINYINT	1 Bytes	(-128，127)	(0，255)	小整数值
SMALLINT	2 Bytes	(-32 768，32 767)	(0，65 535)	大整数值
MEDIUMINT	3 Bytes	(-8 388 608，8 388 607)	(0，16 777 215)	大整数值
INT或INTEGER	4 Bytes	(-2 147 483 648，2 147 483 647)	(0，4 294 967 295)	大整数值
BIGINT	8 Bytes	(-9,223,372,036,854,775,808，9 223 372 036 854 775 807)	(0，18 446 744 073 709 551 615)	极大整数值
FLOAT	4 Bytes	(-3.402 823 466 E+38，-1.175 494 351 E-38)，0，(1.175 494 351 E-38，3.402 823 466 351 E+38)	0，(1.175 494 351 E-38，3.402 823 466 E+38)	单精度
浮点数值
DOUBLE	8 Bytes	(-1.797 693 134 862 315 7 E+308，-2.225 073 858 507 201 4 E-308)，0，(2.225 073 858 507 201 4 E-308，1.797 693 134 862 315 7 E+308)	0，(2.225 073 858 507 201 4 E-308，1.797 693 134 862 315 7 E+308)	双精度
浮点数值
DECIMAL	对DECIMAL(M,D) ，如果M>D，为M+2否则为D+2	依赖于M和D的值	依赖于M和D的值	小数值
日期和时间类型
表示时间值的日期和时间类型为DATETIME、DATE、TIMESTAMP、TIME和YEAR。

每个时间类型有一个有效值范围和一个"零"值，当指定不合法的MySQL不能表示的值时使用"零"值。

TIMESTAMP类型有专有的自动更新特性，将在后面描述。

类型	大小
( bytes)	范围	格式	用途
DATE	3	1000-01-01/9999-12-31	YYYY-MM-DD	日期值
TIME	3	'-838:59:59'/'838:59:59'	HH:MM:SS	时间值或持续时间
YEAR	1	1901/2155	YYYY	年份值
DATETIME	8	'1000-01-01 00:00:00' 到 '9999-12-31 23:59:59'	YYYY-MM-DD hh:mm:ss	混合日期和时间值
TIMESTAMP	4	
'1970-01-01 00:00:01' UTC 到 '2038-01-19 03:14:07' UTC
结束时间是第 2147483647 秒，北京时间 2038-1-19 11:14:07，格林尼治时间 2038年1月19日 凌晨 03:14:07
YYYY-MM-DD hh:mm:ss	混合日期和时间值，时间戳
字符串类型
字符串类型指CHAR、VARCHAR、BINARY、VARBINARY、BLOB、TEXT、ENUM和SET。该节描述了这些类型如何工作以及如何在查询中使用这些类型。

类型	大小	用途
CHAR	0-255 bytes	定长字符串
VARCHAR	0-65535 bytes	变长字符串
TINYBLOB	0-255 bytes	不超过 255 个字符的二进制字符串
TINYTEXT	0-255 bytes	短文本字符串
BLOB	0-65 535 bytes	二进制形式的长文本数据
TEXT	0-65 535 bytes	长文本数据
MEDIUMBLOB	0-16 777 215 bytes	二进制形式的中等长度文本数据
MEDIUMTEXT	0-16 777 215 bytes	中等长度文本数据
LONGBLOB	0-4 294 967 295 bytes	二进制形式的极大文本数据
LONGTEXT	0-4 294 967 295 bytes	极大文本数据
注意：char(n) 和 varchar(n) 中括号中 n 代表字符的个数，并不代表字节个数，比如 CHAR(30) 就可以存储 30 个字符。

CHAR 和 VARCHAR 类型类似，但它们保存和检索的方式不同。它们的最大长度和是否尾部空格被保留等方面也不同。在存储或检索过程中不进行大小写转换。

BINARY 和 VARBINARY 类似于 CHAR 和 VARCHAR，不同的是它们包含二进制字符串而不要非二进制字符串。也就是说，它们包含字节字符串而不是字符字符串。这说明它们没有字符集，并且排序和比较基于列值字节的数值值。

BLOB 是一个二进制大对象，可以容纳可变数量的数据。有 4 种 BLOB 类型：TINYBLOB、BLOB、MEDIUMBLOB 和 LONGBLOB。它们区别在于可容纳存储范围不同。

有 4 种 TEXT 类型：TINYTEXT、TEXT、MEDIUMTEXT 和 LONGTEXT。对应的这 4 种 BLOB 类型，可存储的最大长度不同，可根据实际情况选择。
*/
/*
CREATE TABLE table_name (column_name column_type);

如果你不想字段为 NULL 可以设置字段的属性为 NOT NULL， 在操作数据库时如果输入该字段的数据为NULL ，就会报错。
AUTO_INCREMENT定义列为自增的属性，一般用于主键，数值会自动加1。
PRIMARY KEY关键字用于定义列为主键。 您可以使用多列来定义主键，列间以逗号分隔。
ENGINE 设置存储引擎，CHARSET 设置编码。
*/

CREATE TABLE IF NOT EXISTS student(
   student_id  INT UNSIGNED AUTO_INCREMENT,
   student_name VARCHAR(100) NOT NULL,
   student_age VARCHAR(40) NOT NULL,
   student_address VARCHAR(40) NOT NULL,
   student_date DATE,
   PRIMARY KEY ( `runoob_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*
数据库插入数据
*/
INSERT INTO student ( student_id, student_name,student_age,student_address,)VALUES( value1, value2,...valueN );
/*
下为在MySQL数据库中查询数据通用的 SELECT 语法：

SELECT column_name,column_name
FROM table_name
[WHERE Clause]
[LIMIT N][ OFFSET M]
查询语句中你可以使用一个或者多个表，表之间使用逗号(,)分割，并使用WHERE语句来设定查询条件。
SELECT 命令可以读取一条或者多条记录。
你可以使用星号（*）来代替其他字段，SELECT语句会返回表的所有字段数据
你可以使用 WHERE 语句来包含任何条件。
你可以使用 LIMIT 属性来设定返回的记录数。
你可以通过OFFSET指定SELECT语句开始查询的数据偏移量。默认情况下偏移量为0。
*/
SELECT * FROM student
SELECT student_id,student_name FROM student WHERE student_name="jay" LIMIT 10 
/*
查询语句中你可以使用一个或者多个表，表之间使用逗号, 分割，并使用WHERE语句来设定查询条件。
你可以在 WHERE 子句中指定任何条件。
你可以使用 AND 或者 OR 指定一个或多个条件。
WHERE 子句也可以运用于 SQL 的 DELETE 或者 UPDATE 命令。
WHERE 子句类似于程序语言中的 if 条件，根据 MySQL 表中的字段值来读取指定的数据。
*/
SELECT student_id,student_name FROM student,person WHERE student_name="jay" AND student_address="beijing" LIMIT 10 
/*
你可以同时更新一个或多个字段。
你可以在 WHERE 子句中指定任何条件。
你可以在一个单独表中同时更新数据。
*/
UPDATE student SET student_name="value" WHERE student_id=10;
/*
如果没有指定 WHERE 子句，MySQL 表中的所有记录将被删除。
你可以在 WHERE 子句中指定任何条件
您可以在单个表中一次性删除记录。
*/
DELETE FROM student 
DELETE FROM student WHERE student_name="value"
/*
你可以在 WHERE 子句中指定任何条件。
你可以在 WHERE 子句中使用LIKE子句。
你可以使用LIKE子句代替等号 =。
LIKE 通常与 % 一同使用，类似于一个元字符的搜索。
你可以使用 AND 或者 OR 指定一个或多个条件。
你可以在 DELETE 或 UPDATE 命令中使用 WHERE...LIKE 子句来指定条件
*/
SELECT student_id,student_name FROM student WHERE student_name LIKE="%COM"
/*
UNION ALL 实例选取二个表共同的值
*/
SELECT student_id FROM person
UNION ALL
SELECT student_id FROM student
/*
我们知道从 MySQL 表中使用 SQL SELECT 语句来读取数据。
如果我们需要对读取的数据进行排序，我们就可以使用 MySQL 的 ORDER BY 子句来设定你想按哪个字段哪种方式来进行排序，再返回搜索结果。
你可以使用任何字段来作为排序的条件，从而返回排序后的查询结果。
你可以设定多个字段来排序。
你可以使用 ASC 或 DESC 关键字来设置查询结果是按升序或降序排列。 默认情况下，它是按升序排列。
你可以添加 WHERE...LIKE 子句来设置条件。
*/
SELECT student_id FROM student WHERE student_name="value" ORDER BY student_id ASC;