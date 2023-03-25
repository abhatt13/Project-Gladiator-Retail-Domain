Create table region(
	region_key int PRIMARY KEY,
	name Varchar(40),
	Comment Varchar(152)
);
Create table nation(
	Nationkey int primary key,
	Name varchar(50) references region(region_key),	
	Regionkey int,
	Comment varchar(120)
);
Create table Supplier(
	suppkey int PRIMARY KEY,
	name Varchar(40),
	Address varchar(160),
	Nationkey int references nation(nationkey),
	Phone int,
	Acctbal float(11,2),
	Comment varchar(180)
);
Create table customer(
	custkey int(38) primary key,
	name varchar(25),
	address varchar(40),
	nationkey int(38) references nation(nationkey),
	Phone varchar(15),
	Acctbal float(12,2),
	Mktsegment varchar(10),
	Comment varchar(112)
);
Create table part (
	partkey int PRIMARY KEY, 
	name Varchar(40),
	mfgr varchar(40),
	brand varchar(40), 
	type varchar(40),
	size int,
	container varchar(40),
	retailprice float(11,2),
	comment varchar(152)
);
Create table partsupply(
	partkey int references part(partkey),
	suppkey int references supplier(suppkey),
	availqty int,
	supplycost float(12,2),
	comment varchar(199)
);
Create table lineitem(
	orderkey int references orders(orderkey),
	partkey int references partsupp(partkey),
	suppkey int references partsupp(suppkey),
	linenumber int,
	quantity float(11,2),
	extendedprice float(11,2),
	discount float(11,2),
	tax float(11,2),
	returnflag varchar(1),
	linestatus varchar(1),
	shipdate DATE,
	commitdate DATE, 
	receiptdate DATE,
	shipinstruct varchar(25),
	shipmode varchar(10),
	comment varchar(44)
);
Create table orders(
	Orderkey int primary key,
	custkey int references customer(custkey),
	Orderstatus varchar(1),
	Totalprice float(12,2),
	Order_date date,
	Orderpriority varchar(15),
	Clerk varchar(15),
	Shippriority int,
	Comment varchar(79)
);
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/region_0_0_0.csv'  INTO TABLE region  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/nation_0_0_0.csv'  INTO TABLE nation  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/supplier_0_0_0.csv'  INTO TABLE Supplier  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/customer_0_0_0.csv'  INTO TABLE customer  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/part_0_0_0.csv'  INTO TABLE part  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/partsupp_0_1_0.csv'  INTO TABLE partsupply  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/partsupp_0_2_0.csv'  INTO TABLE partsupply  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/partsupp_0_3_0.csv'  INTO TABLE partsupply  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_0_0.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_0_1.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_1_0.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_1_1.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_2_0.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_2_1.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_2_2.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_3_0.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_3_1.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_3_2.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_4_0.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_4_1.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_5_0.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_5_1.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_6_0.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_6_1.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_7_0.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/lineitem_0_7_1.csv'  INTO TABLE lineitem  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/orders_0_0_0.csv'  INTO TABLE orders  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/orders_0_1_0.csv'  INTO TABLE orders  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/orders_0_1_1.csv'  INTO TABLE orders  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/orders_0_3_0.csv'  INTO TABLE orders  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA LOCAL INFILE’'/home/ak/Downloads/drive-download-20201230T045705Z-001/orders_0_3_1.csv'  INTO TABLE orders  FIELDS TERMINATED BY ','  ENCLOSED BY '"' LINES TERMINATED BY '\n';