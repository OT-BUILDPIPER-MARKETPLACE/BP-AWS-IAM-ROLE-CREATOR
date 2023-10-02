# BP-AWS-IAM-ROLE-CREATOR
I'll let people to create AWS IAM role via this step

## Setup
* Clone the code available at [BP-AWS-IAM-ROLE-CREATOR](https://github.com/OT-BUILDPIPER-MARKETPLACE/BP-AWS-IAM-ROLE-CREATOR)
* Build the docker image
```
git submodule init
git submodule update
docker build -t ot/aws-iam-role-creator:0.1 .
```

* Do local testing via image only

```
# Create role with
docker run -it --rm -e AWS_ACCESS_KEY_ID=<xxx> -e AWS_SECRET_ACCESS_KEY=<xxx> ot/aws-iam-role-creator:0.1
```
