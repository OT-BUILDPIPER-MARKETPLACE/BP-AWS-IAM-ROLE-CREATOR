FROM amazon/aws-cli

RUN yum update -y 
RUN yum install jq gettext -y

ENV SLEEP_DURATION 5s
ENV ROLE_NAME buildpiper

ENV ACTIVITY_SUB_TASK_CODE AWS_IAM_ROLE_CREATOR 
ENV WHITELIST_ARN "arn:aws:iam::702037529261:role/BPSAAS"
ENV AWS_PAGER ""

COPY build.sh .
COPY assume-role-policy.template .

ADD BP-BASE-SHELL-STEPS /opt/buildpiper/shell-functions/

ENTRYPOINT [ "./build.sh" ]