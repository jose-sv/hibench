#!/bin/bash

#modify etc/hosts file to avoid connection error
cp /etc/hosts /etc/hostsbak
sed -i 's/::1/#::1/' /etc/hostsbak
cat /etc/hostsbak > /etc/hosts
rm -rf /etc/hostsbak
#run wordcount example
/usr/bin/restart_hadoop_spark.sh
echo "running wordcount"
${HIBENCH_HOME}/bin/workloads/micro/wordcount/prepare/prepare.sh
${HIBENCH_HOME}/bin/workloads/micro/wordcount/hadoop/run.sh
echo "running sort"
${HIBENCH_HOME}/bin/workloads/micro/sort/prepare/prepare.sh
${HIBENCH_HOME}/bin/workloads/micro/sort/hadoop/run.sh
echo "running dfsioe"
${HIBENCH_HOME}/bin/workloads/micro/dfsioe/prepare/prepare.sh
${HIBENCH_HOME}/bin/workloads/micro/dfsioe/hadoop/run.sh
echo "running terasort"
${HIBENCH_HOME}/bin/workloads/micro/terasort/prepare/prepare.sh
${HIBENCH_HOME}/bin/workloads/micro/terasort/hadoop/run.sh
echo "running sleep"
${HIBENCH_HOME}/bin/workloads/micro/sleep/prepare/prepare.sh
${HIBENCH_HOME}/bin/workloads/micro/sleep/hadoop/run.sh
