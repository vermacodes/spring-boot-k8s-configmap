FROM openjdk:8
COPY target/demo.jar demo.jar
COPY run.sh run.sh
ENTRYPOINT [ "/bin/bash", "run.sh" ]