FROM java:openjdk-8-jre

ENV DEBIAN_FRONTEND noninteractive
ENV SPARK_VERSION=2.1.1
ENV HADOOP_VERSION=2.7

ENV SPARK_HOME /opt/apache-spark
ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8088
ENV SPARK_MASTER_HOST spark-master

#ENV BIGTOP_VERSION=1.2.0
#ADD https://www.apache.org/dist/bigtop/bigtop-${BIGTOP_VERSION}/repos/debian8/bigtop.list /etc/apt/sources.list.d/
#RUN curl https://www.apache.org/dist/bigtop/bigtop-${BIGTOP_VERSION}/repos/GPG-KEY-bigtop | apt-key add -
#RUN apt-get update && \
#    apt-get install -y spark-core spark-master supervisor && \
#    rm -rf /var/lib/apt/lists/* && \
#    apt-get clean

RUN apt-get update && \
    apt-get install -y wget supervisor && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    wget -q http://apache.proserve.nl/spark/spark-"$SPARK_VERSION"/spark-"$SPARK_VERSION"-bin-hadoop"$HADOOP_VERSION".tgz \
    -O /tmp/spark-"$SPARK_VERSION"-bin-hadoop"$HADOOP_VERSION".tgz && \
    mkdir "$SPARK_HOME" && \
    tar zxvf /tmp/spark-"$SPARK_VERSION"-bin-hadoop"$HADOOP_VERSION".tgz -C "$SPARK_HOME" --strip 1 && \
    rm /tmp/spark-"$SPARK_VERSION"-bin-hadoop"$HADOOP_VERSION".tgz
    
ADD spark-supervisor.conf /etc/supervisor/conf.d/
ADD start-spark-master.sh "$SPARK_HOME"/sbin/start-spark-master.sh
RUN chmod 755 "$SPARK_HOME"/sbin/start-spark-master.sh

EXPOSE 8088 7077
CMD ["supervisord", "-n"]