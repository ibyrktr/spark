#!/bin/bash

echo "Spark home: " $SPARK_HOME 							#/opt/apache-spark
echo "Spark master host: " $SPARK_MASTER_HOST 				#localhost
echo "Spark master port: " $SPARK_MASTER_PORT				#7077
echo "Spark master webui port: " $SPARK_MASTER_WEBUI_PORT	#8088

#cd $SPARK_HOME && ./sbin/start-master.sh org.apache.spark.deploy.master.Master \
#    -h $SPARK_MASTER_HOST -p $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT
cd $SPARK_HOME && ./bin/spark-class org.apache.spark.deploy.master.Master \
    -h $SPARK_MASTER_HOST -p $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT    