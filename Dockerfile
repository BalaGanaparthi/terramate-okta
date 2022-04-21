FROM golang:alpine AS BUILDER

RUN apk add --update git bash openssh make 

ARG BRANCH
RUN echo "Based on branch : " $BRANCH

WORKDIR $GOPATH/src/github.com/okta/terraform-provider-okta
RUN git clone https://github.com/okta/terraform-provider-okta.git ./ && \
    git checkout $BRANCH && \
    make tools && \
    make build && \
    echo 'provider_installation { dev_overrides {  "okta/okta" = "/go/bin" } direct {} }' >> $GOPATH/bin/.terraformrc

FROM hashicorp/terraform:latest

COPY --from=BUILDER /go/bin/terraform-provider-okta $GOPATH/bin
COPY --from=BUILDER /go/bin/.terraformrc ~/