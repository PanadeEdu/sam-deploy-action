FROM ubuntu

LABEL version="1.0.0"

LABEL com.github.actions.name="SAM Deploy Action"
LABEL com.github.actions.description="Deploy AWS SAM Stack"
LABEL com.github.actions.icon="upload-cloud"
LABEL com.github.actions.color="blue"

LABEL repository="https://github.com/r0zar/sam-deploy-action"
LABEL homepage="https://github.com/r0zar/sam-deploy-action"
LABEL maintainer="Ross Ragsdale <ross.ragsdale@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y zip unzip curl
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && bash ./aws/install

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
