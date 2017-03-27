#!/usr/bin/env bash

cd giraph-core

VERSION=$(mvn help:evaluate -Dexpression=project.version | grep -v "^\[" 2>/dev/null)

SNAPSHOT=$(echo ${VERSION} | grep -o SNAPSHOT)

if [ "${SNAPSHOT}" == "SNAPSHOT" ]
then
    REPO_ID=private-nexus-snapshots
    NEXUS_URL=http://pilot.eldorado.trufa.local:8081/repository/maven-snapshots
else
    REPO_ID=private-nexus
    NEXUS_URL=http://pilot.eldorado.trufa.local:8081/repository/maven-releases
fi

mvn -Dmaven.test.skip=true -Phadoop_yarn -Dhadoop.version=2.7.2 clean compile

mvn deploy:deploy-file -Durl=${NEXUS_URL} \
                       -DrepositoryId=${REPO_ID} \
                       -Dfile=./target/giraph-${VERSION}-for-hadoop-2.7.2-jar-with-dependencies.jar \
                       -DgroupId=org.apache.giraph \
                       -DartifactId=giraph-core \
                       -Dversion=${VERSION} \
                       -Dpackaging=jar \
                       -Dclassifier=savanna \
                       -DgeneratePom=true \
                       -DgeneratePom.description="Custom Apache Giraph build for savanna project" \
                       -DrepositoryLayout=default
