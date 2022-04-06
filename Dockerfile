FROM golang:1.16-alpine
# Set destination for COPY
WORKDIR /app
 
COPY ./go.mod .  
COPY ./go.sum .  

RUN go mod download

COPY *.go ./    
# Build
RUN go build -o /cs610      

EXPOSE 8080

CMD [ "/cs610" ]



# docker run --rm -v C:\Users\mrudu\go\src\cs610\cmd:/root/.cache/ aquasec/trivy:0.19.2 aquasec/trivy:0.19.2 python:3.4-alpine
# FROM golang:1.16-alpine AS build-env
# RUN apk update
# ADD . /cs610
# RUN go build -o main /Users/mrudu/go/src/cs610/cmd
# FROM alpine
# RUN apk update
# WORKDIR /app
# COPY --from=build-env /cs610/cmd /app/
# EXPOSE 8080
# ENTRYPOINT ["./main"]
