#!/bin/bash

if [ $# == 1 ];
then
      MAVEN_PROFILE=$1
      #MAVEN_OPTS="$MAVEN_OPTS"
      #export MAVEN_OPTS
      echo "Profile: ${MAVEN_PROFILE}"
      mvn clean -U install -P${MAVEN_PROFILE},index,postgres -Dspring.config=classpath:META-INF/complex-indexer-spring.xml -Dmaven.test.skip
else
      echo ""
      echo "ERROR: wrong number of parameters ($#)."
      echo "usage: MAVEN_PROFILE"
      echo "usage: MAVEN_PROFILE: the name of the maven settings to use for connecting to the database."
      echo ""
      exit 1
fi