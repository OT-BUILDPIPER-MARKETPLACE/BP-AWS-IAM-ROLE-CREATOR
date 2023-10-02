#!/bin/bash

source /opt/buildpiper/shell-functions/log-functions.sh
source /opt/buildpiper/shell-functions/aws-functions.sh
source /opt/buildpiper/shell-functions/functions.sh

logInfoMessage "I'll be creating a role name [$ROLE_NAME]"

sleep  $SLEEP_DURATION

TASK_STATUS=0

ROLE_EXISTS=`roleExists ${ROLE_NAME}`

if [ "$ROLE_EXISTS" -eq 0 ]
then
    logWarningMessage "Role with name ${ROLE_NAME} already exists"
else
    logInfoMessage "Creating Role, as it already doesn't exists"
    envsubst < assume-role-policy.template > assume-role-policy
    createRole ${ROLE_NAME} assume-role-policy
fi

saveTaskStatus ${TASK_STATUS} ${ACTIVITY_SUB_TASK_CODE}