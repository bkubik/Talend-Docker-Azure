FROM anapsix/alpine-java:8u121b13_jdk

##Enter the name of the .zip file you wish to run
ENV FILE_NAME="Test_0.1.zip"

##Enter the name of Talend Job you created.
ENV JOB_NAME="Test"

##Pass any context params specific to the Talend Job.
#Ex: ENV CONTEXTARGS="--context=PROD --context_param VAR1=VAR1" 
ENV CONTEXTARGS=""

ADD ${FILE_NAME} .
RUN unzip ${FILE_NAME}

RUN echo "./${JOB_NAME}/${JOB_NAME}_run.sh ${CONTEXTARGS}" > ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

RUN chmod +x /${JOB_NAME}/${JOB_NAME}_run.sh

CMD [ "/bin/ash", "./entrypoint.sh" ]
