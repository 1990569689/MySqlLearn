/*
CREATE DATABASE 数据库名;
创建数据库
DROP DATABASE 数据库名;
删除数据库
DROP TABLE 数据表名;
删除数据表
CREATE TEMPORARY TABLE 数据表名;
创建临时表
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
   PRIMARY KEY ( student_id )
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
SELECT * FROM student;
SELECT student_id,student_name FROM student WHERE student_name="jay" LIMIT 10 ;
/*
查询语句中你可以使用一个或者多个表，表之间使用逗号, 分割，并使用WHERE语句来设定查询条件。
你可以在 WHERE 子句中指定任何条件。
你可以使用 AND 或者 OR 指定一个或多个条件。
WHERE 子句也可以运用于 SQL 的 DELETE 或者 UPDATE 命令。
WHERE 子句类似于程序语言中的 if 条件，根据 MySQL 表中的字段值来读取指定的数据。
*/
SELECT student_id,student_name FROM student,person WHERE student_name="jay" AND student_address="beijing" LIMIT 10 ;
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
DELETE FROM student ;
DELETE FROM student WHERE student_name="value";
/*
你可以在 WHERE 子句中指定任何条件。
你可以在 WHERE 子句中使用LIKE子句。
你可以使用LIKE子句代替等号 =。
LIKE 通常与 % 一同使用，类似于一个元字符的搜索。
你可以使用 AND 或者 OR 指定一个或多个条件。
你可以在 DELETE 或 UPDATE 命令中使用 WHERE...LIKE 子句来指定条件
*/
SELECT student_id,student_name FROM student WHERE student_name LIKE="%COM";
/*
UNION ALL 实例选取二个表共同的值
*/
SELECT student_id FROM person UNION ALL SELECT student_id FROM student;
/*
我们知道从 MySQL 表中使用 SQL SELECT 语句来读取数据。
如果我们需要对读取的数据进行排序，我们就可以使用 MySQL 的 ORDER BY 子句来设定你想按哪个字段哪种方式来进行排序，再返回搜索结果。
你可以使用任何字段来作为排序的条件，从而返回排序后的查询结果。
你可以设定多个字段来排序。
你可以使用 ASC 或 DESC 关键字来设置查询结果是按升序或降序排列。 默认情况下，它是按升序排列。
你可以添加 WHERE...LIKE 子句来设置条件。
*/
SELECT student_id FROM student WHERE student_name="value" ORDER BY student_id ASC;
----删除表的student_id字段
ALTER TABLE student  DROP student_id;
---如果数据表中只剩余一个字段则无法使用DROP来删除字段。MySQL 中使用 ADD 子句来向数据表中添加列，如下实例在表 testalter_tbl 中添加 i 字段，并定义数据类型:
ALTER TABLE student ADD student_id INT;
/*
如果你需要指定新增字段的位置，可以使用MySQL提供的关键字 FIRST (设定位第一列)， AFTER 字段名（设定位于某个字段之后）。
尝试以下 ALTER TABLE 语句, 在执行成功后，使用 SHOW COLUMNS 查看表结构的变化：
*/
ALTER TABLE student ADD student_id INT FIRST;

ALTER TABLE student ADD student_id INT AFTER student_name;
---如果需要修改字段类型及名称, 你可以在ALTER命令中使用 MODIFY 或 CHANGE 子句 。
ALTER TABLE student MODIFY student_name VARCHAR(10);
---使用 CHANGE 子句, 语法有很大的不同。 在 CHANGE 关键字之后，紧跟着的是你要修改的字段名，然后指定新字段名及类型
ALTER TABLE student CHANGE student_name student_newname VARCHAR(10);
---你可以使用 ALTER 来修改字段的默认值
ALTER TABLE student ALTER student_name SET DEFAULT 1000;
--你也可以使用 ALTER 命令及 DROP子句来删除字段的默认值
ALTER TABLE student ALTER student_name DROP DEFAULT;
--修改数据表类型，可以使用 ALTER 命令及 TYPE 子句来完成
ALTER TABLE student ENGINE = MYISAM;
--如果需要修改数据表的名称，可以在 ALTER TABLE 语句中使用 RENAME 子句来实现。
ALTER TABLE student RENAME TO person;
/*
MySQL 临时表在我们需要保存一些临时数据时是非常有用的。临时表只在当前连接可见，当关闭连接时，Mysql会自动删除表并释放所有空间。

临时表在MySQL 3.23版本中添加，如果你的MySQL版本低于 3.23版本就无法使用MySQL的临时表。不过现在一般很少有再使用这么低版本的MySQL数据库服务了。

MySQL临时表只在当前连接可见，如果你使用PHP脚本来创建MySQL临时表，那每当PHP脚本执行完成后，该临时表也会自动销毁。

如果你使用了其他MySQL客户端程序连接MySQL数据库服务器来创建临时表，那么只有在关闭客户端程序时才会销毁临时表，当然你也可以手动销毁。
*/
--设置开始自增数
 ALTER TABLE student_id AUTO_INCREMENT = 100;
 /*
有些 MySQL 数据表中可能存在重复的记录，有些情况我们允许重复数据的存在，但有时候我们也需要删除这些重复的数据。

本章节我们将为大家介绍如何防止数据表出现重复数据及如何删除数据表中的重复数据。

防止表中出现重复数据
你可以在 MySQL 数据表中设置指定的字段为 PRIMARY KEY（主键） 或者 UNIQUE（唯一） 索引来保证数据的唯一性。
让我们尝试一个实例：下表中无索引及主键，所以该表允许出现多条重复记录
 */
 CREATE TABLE IF NOT EXISTS student(
   --且声明了student_id的自增
   student_id  INT UNSIGNED AUTO_INCREMENT,
   student_name VARCHAR(100) NOT NULL,
   student_age VARCHAR(40) NOT NULL,
   student_address VARCHAR(40) NOT NULL,
   student_date DATE,
   ---UNIQUE (last_name, first_name)设置唯有性 设置了student_id,student_name的唯一性相同数据插入报错
   PRIMARY KEY ( student_id,student_name)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;