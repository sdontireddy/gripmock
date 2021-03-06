FROM tkpd/gripmock:v1.11-beta
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
#RUN mkdir /GRPC
# WORKDIR /GRPC
# Change the hostnames
# RUN wget htttp:///XXXXHOST.COM/protosdirectory.tar.gz --no-check-certificate
# RUN tar -xvf v0.2.96.tar.gz
# RUN mv /GRPC/protosdirectory /protos
WORKDIR /protos
COPY tools/* //usr/local/bin/
EXPOSE 4771 4770 
ENTRYPOINT [ "custom-entry.sh" ]
#ENTRYPOINT [ "/bin/sh" ]
