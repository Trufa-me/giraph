#!/usr/bin/env bash

cd giraph-core

VERSION=$(mvn help:evaluate -Dexpression=project.version | grep -v "^\[" 2>/dev/null)

SNAPSHOT=$(echo ${VERSION} | grep -o SNAPSHOT)

if [ "${SNAPSHOT}" == "SNAPSHOT" ]
then
    mvn -DaltDeploymentRepository=private-nexus-snapshots::default::http://pilot.eldorado.trufa.local:8081/maven-snapshots -Dmaven.test.skip=true deploy
else
    mvn -DaltDeploymentRepository=private-nexus::default::http://pilot.eldorado.trufa.local:8081/repository/maven-releases -Dmaven.test.skip=true deploy
fi
