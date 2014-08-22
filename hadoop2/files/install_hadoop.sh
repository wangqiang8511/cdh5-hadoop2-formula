#!/bin/bash

{%- from 'hadoop2/settings.sls' import hadoop with context %}

# Install CDH5 hadoop
yum install -y hadoop-yarn-resourcemanager
yum install -y hadoop-hdfs-namenode
yum install -y hadoop-yarn-nodemanager
yum install -y hadoop-hdfs-datanode
yum install -y hadoop-mapreduce
yum install -y hadoop-mapreduce-historyserver
yum install -y hadoop-yarn-proxyserver

chkconfig hadoop-yarn-resourcemanager off 
chkconfig hadoop-yarn-nodemanager off 
chkconfig hadoop-yarn-proxyserver off 
chkconfig hadoop-hdfs-namenode off 
chkconfig hadoop-hdfs-datanode off 
chkconfig hadoop-mapreduce-historyserver off 
