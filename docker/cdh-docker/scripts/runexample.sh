#!/bin/bash

#modify etc/hosts file to avoid connection error
cp /etc/hosts /etc/hostsbak
sed -i 's/::1/#::1/' /etc/hostsbak
cat /etc/hostsbak > /etc/hosts
rm -rf /etc/hostsbak
#run wordcount example
/usr/bin/restart_hadoop_spark.sh
echo "running wordcount"
${HIBENCH_HOME}/bin/workloads/ml/als/prepare/prepare.sh
echo 'prepare completed, attach perf, then press a key'
read
${HIBENCH_HOME}/bin/workloads/ml/als/spark/run.sh
echo 'run completed, dettach perf, then press a key'
read
# echo "running sort"
# ${HIBENCH_HOME}/bin/workloads/micro/sort/prepare/prepare.sh
# perf stat -e LLC-loads,LLC-load-misses,LLC-stores,LLC-prefetches -o /tmp/sort.perf ${HIBENCH_HOME}/bin/workloads/micro/sort/hadoop/run.sh
# echo "running dfsioe"
# ${HIBENCH_HOME}/bin/workloads/micro/dfsioe/prepare/prepare.sh
# perf stat -e LLC-loads,LLC-load-misses,LLC-stores,LLC-prefetches -o /tmp/dfsioe.perf ${HIBENCH_HOME}/bin/workloads/micro/dfsioe/hadoop/run.sh
# echo "running terasort"
# ${HIBENCH_HOME}/bin/workloads/micro/terasort/prepare/prepare.sh
# perf stat -e LLC-loads,LLC-load-misses,LLC-stores,LLC-prefetches -o /tmp/terasort.perf ${HIBENCH_HOME}/bin/workloads/micro/terasort/hadoop/run.sh
# echo "running sleep"
# ${HIBENCH_HOME}/bin/workloads/micro/sleep/prepare/prepare.sh
# perf stat -e LLC-loads,LLC-load-misses,LLC-stores,LLC-prefetches -o /tmp/sleep.perf ${HIBENCH_HOME}/bin/workloads/micro/sleep/hadoop/run.sh
