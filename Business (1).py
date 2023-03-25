from pyspark.sql import SparkSession
from pyspark.sql.functions import lit
from pyspark.sql.types import *
from pyspark.sql.types import StringType
from pyspark.sql.functions import udf

class RetailJob:
	def __init__(self):
		self.spark = SparkSession.builder\
				.master("local")\
				.appName("RetailJob")\
				.getOrCreate()

	def extract_lineitem(self):
		file_path = "file:///home/ak/dataset/england_realestate_csv_files/england_councils/"

		
lineitemdf = spark.read.format("jdbc")\
.option("url","jdbc:mysql://localhost:3306/retaildb")\
.option("driver", "com.mysql.jdbc.Driver")\
.option("dbtable", "lineitem")\
.option("lowerBound", "0")\
.option("upperBound", "6001215")\
.option("numPartitions",20")\
.option("partitionColumn","orderkey")\
.option("user", "hiveuser")\
.option("password", "hivepassword")\
.load()


		return lineitemdf


def transform(self, lineitemdf):
		#lineitemdf.show(10, truncate=False)
		
		
	solndf=lineitemdf.where(col("shipdate") < '1998-10-12')
	decrease = udf(lambda a,b: a*(1-b),DoubleType())
	
	soln1=solndf.groupBy("returnflag","linestatus")\
		.agg(F.sum("quantity"))\
		.sort("returnflag","linestatus")
	soln2=solndf.groupBy("returnflag","linestatus")\
		.agg(F.sum("extendedprice"))\
		.sort("returnflag","linestatus")
	soln3=solndf.groupBy("returnflag","linestatus")\
		.agg(F.sum(decrease("extendedprice","discount")))\
		.sort("returnflag","linestatus")
	soln5=solndf.groupBy("returnflag","linestatus")\
		.agg(F.avg("quantity"))\
		.sort("returnflag","linestatus")
	soln6=solndf.groupBy("returnflag","linestatus")\
		.agg(F.avg("extendedprice"))\
		.sort("returnflag","linestatus")
	soln7=solndf.groupBy("returnflag","linestatus")\
		.agg(F.avg("discount"))\
		.sort("returnflag","linestatus")
	soln8=solndf.groupBy("returnflag","linestatus")\
		.agg(F.count("quantity"))\
		.sort("returnflag","linestatus")
	solndf1=soln1\
	.join(soln2,on=['returnflag','linestatus'],how='inner')
	solndf2=solndf1\
	.join(soln3,on=['returnflag',値inestatus'],how='inner')
	solndf3=solndf2\
	.join(soln5,on=['returnflag',値inestatus'],how='inner')
	solndf4=solndf3\
	.join(soln6,on=['returnflag',値inestatus'],how='inner')
	solndf5=solndf4\
	.join(soln7,on=['returnflag',値inestatus'],how='inner')
	solndf6=solndf5\
	.join(soln8,on=['returnflag',値inestatus'],how='inner')
	solndf=solndf6\
	.select(col('returnflag'),\
	col('linestatus'),\
	col('sum(quantity)').alias('total_quantity'),\
	col('sum(extendedprice)').alias('total_extended_price'),\
	col('sum(<lambda>	(extendedprice,discount))').alias('discounted_extended_price'),\
	col('avg(quantity)').alias('average_quantity'),\
	col('avg(extendedprice)').alias('avg_extended_price'),\
	col('avg(discount)').alias('avg_discount'),\
	col('count(quantity)').alias('quantity_count'))
	

	solndffinal = solndf\
	.withColumn('total_quantity',solndf.total_quantity.cast(DecimalType(38,2)))\
	.withColumn('total_extented_price',solndf.total_extended_price.cast(DecimalType(38,2)))\
	.withColumn('discounted_extented_price',solndf.discounted_extended_price.cast(DecimalType(38,2)))\
	.withColumn('average_quantity',solndf.average_quantity.cast(DecimalType(38,2)))\
	.withColumn('avg_extended_price',solndf.avg_extended_price.cast(DecimalType(38,2)))\
	.withColumn('avg_discount',solndf.avg_discount.cast(DecimalType(38,3)))

solndffinal.show()

		

job = RetailJob()
job.transform(job.extract_lineitem())
		

