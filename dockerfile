FROM docker.repo.frg.tech/quality-engineering/fanatics-gripmock:1.10.1
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
WORKDIR /
RUN mkdir /GRPC
WORKDIR /GRPC
RUN wget https://jaxf-github.fanatics.corp/gom/models/archive/v0.2.96.tar.gz --no-check-certificate
RUN tar -xvf v0.2.96.tar.gz
RUN mv /GRPC/models-0.2.96/protos /protos
WORKDIR /protos
COPY tools/* //usr/local/bin/
EXPOSE 4771 4770 
ENTRYPOINT [ "custom-entry.sh" ]
#ENTRYPOINT [ "/bin/sh" ]