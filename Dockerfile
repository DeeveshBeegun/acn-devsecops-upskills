FROM openjdk:17-ea-jdk-buster
MAINTAINER deeveshbeegun

RUN groupadd -g 999 appgroup && \
    useradd -r -u 999 -g appgroup deevesh
RUN mkdir /usr/app && chown deevesh:appgroup /usr/app
WORKDIR /usr/app

COPY --chown=deevesh:appgroup target/acn-taskmanger-upskills-1.0-SNAPSHOT.jar /usr/app/acn-taskmanger-upskills.jar

USER deevesh
EXPOSE 8082

ENTRYPOINT ["java","-jar","/usr/app/acn-taskmanger-upskills.jar"]