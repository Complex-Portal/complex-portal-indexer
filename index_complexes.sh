#!/bin/bash

#SBATCH --time=06-00:00:00   # walltime
#SBATCH --ntasks=1   # number of tasks
#SBATCH --cpus-per-task=5   # number of CPUs Per Task i.e if your code is multi-threaded
#SBATCH --nodes=1   # number of nodes
#SBATCH -p production   # partition(s)
#SBATCH --mem=4G   # memory per node
#SBATCH -J "COMPLEX_INDEXER"   # job name
#SBATCH -o "/nfs/production/hhe/intact/data/complex-indexer-logs/index-complexes-%j.out"   # job output file
#SBATCH --mail-user=intact-dev@ebi.ac.uk   # email address
#SBATCH --mail-type=ALL

if [ $# == 1 ];
then
      MAVEN_PROFILE=$1
      #MAVEN_OPTS="$MAVEN_OPTS"
      #export MAVEN_OPTS
      echo "Profile: ${MAVEN_PROFILE}"
      mvn clean -U install -P${MAVEN_PROFILE},index -Dspring.config=classpath:META-INF/complex-indexer-spring.xml -Dmaven.test.skip -Dmaven.repo.local=repository
else
      echo ""
      echo "ERROR: wrong number of parameters ($#)."
      echo "usage: MAVEN_PROFILE"
      echo "usage: MAVEN_PROFILE: the name of the maven settings to use for connecting to the database."
      echo ""
      exit 1
fi