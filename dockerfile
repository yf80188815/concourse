# Dockerfile
FROM golang:1.16-alpine

WORKDIR /app

ENV CGO_ENABLED=0
ENV GOPROXY=https://goproxy.cn,direct
ENV GOPROXYTIMEOUT=300s
COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .

RUN go build -o main .

EXPOSE 8080

CMD ["./main"]