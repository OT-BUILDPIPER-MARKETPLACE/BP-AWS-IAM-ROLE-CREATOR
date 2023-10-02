FROM amazon/aws-cli

RUN yum update -y 
RUN yum install jq -y

ENV SLEEP_DURATION 5s
ENV ROLE_NAME buildpiper

ENV ACTIVITY_SUB_TASK_CODE AWS_IAM_ROLE_CREATOR 

COPY build.sh .
COPY assume-role-policy.template .

ADD BP-BASE-SHELL-STEPS /opt/buildpiper/shell-functions/

ENTRYPOINT [ "./build.sh" ]