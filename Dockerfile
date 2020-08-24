FROM amazon/aws-cli:2.0.42

RUN yum update -y && yum install -y \
  tar \
  gzip \
  zip

