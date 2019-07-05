# https://raw.githubusercontent.com/spring-cloud/spring-cloud-dataflow/v2.0.1.RELEASE/spring-cloud-dataflow-server/docker-compose.yml
# https://docs.spring.io/spring-cloud-dataflow/docs/current/reference/htmlsingle/#getting-started-cloudfoundry
mkdir /home/springCloudDataflow

wget https://repo.spring.io/release/org/springframework/cloud/spring-cloud-dataflow-server/2.0.1.RELEASE/spring-cloud-dataflow-server-2.0.1.RELEASE.jar

wget https://repo.spring.io/release/org/springframework/cloud/spring-cloud-dataflow-shell/2.0.1.RELEASE/spring-cloud-dataflow-shell-2.0.1.RELEASE.jar

wget http://repo.spring.io/release/org/springframework/cloud/spring-cloud-skipper-server/2.0.0.RELEASE/spring-cloud-skipper-server-2.0.0.RELEASE.jar



java -jar spring-cloud-dataflow-server-2.0.1.RELEASE.jar & java -jar spring-cloud-dataflow-shell-2.0.1.RELEASE.jar & 
java -jar spring-cloud-skipper-server-2.0.0.RELEASE.jar

