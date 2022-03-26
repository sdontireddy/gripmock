# GripMock
GripMock is an enhacement to the gripmock server https://github.com/tokopedia/gripmock

### What is gripmock
```
GripMock is a  **mock server** for **GRPC** services. It's using a `.proto` file to generate implementation of gRPC service for you.
You can use gripmock for setting up end-to-end testing or as a dummy server in a software development phase.
The server implementation is in GoLang but the client can be any programming language that support gRPC.
```

There is minor limitation to this https://github.com/tokopedia/gripmock where we need to specify the proto file while running docker

Ex: docker run -p 4770:4770 -p 4771:4771 -v /mypath:/proto tkpd/gripmock /proto/hello.proto

Unless we specify **/proto/hello.proto** gripmock server wont run.

This usecase is fine aslong as we have limited number of protos.

However often there will be a number of models in a project that needs to be mocked and becomes maintainance challenge to keep updating these protos every time a new proto file is added to the models.

So inorder to eliminate the need to specify the .proto file . We can use this enhacement which essentially uses a directory defined with all the protos. Copies in to the repo and feeds each of the available proto to the startup script.


### How to use

Just pul all your protos in protos folder and run **docker build** to generate a new custom image and you can just run using 

```
docker build . -t "your_image_name"
```
```
    
    docker run -p 4770:4770 -p 4771:4771 -v /protos:/protos your_image_name
    
```
