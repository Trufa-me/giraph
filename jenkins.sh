#!/usr/bin/env bash

cd giraph-core

VERSION=$(mvn help:evaluate -Dexpression=project.version | grep -v "^\[" 2>/dev/null)

SNAPSHOT=$(echo ${VERSION} | grep -o SNAPSHOT)

if [ "${SNAPSHOT}" == "SNAPSHOT" ]
then
    DEPLOYMENT_REPO=private-nexus-snapshots::default::http://pilot.eldorado.trufa.local:8081/repository/maven-snapshots
else
    DEPLOYMENT_REPO=private-nexus::default::http://pilot.eldorado.trufa.local:8081/repository/maven-releases
fi

mvn -DaltDeploymentRepository=${DEPLOYMENT_REPO} -Dmaven.test.skip=true -Phadoop_yarn -Dhadoop.version=2.7.2 clean compile deploy
